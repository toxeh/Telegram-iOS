import Foundation
import Postbox

public enum ProxyServerConnection: Equatable, Hashable, Codable {
    case socks5(username: String?, password: String?)
    case mtp(secret: Data)
    case mtp3(secret: Data, wsPath: String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        switch try container.decode(Int32.self, forKey: "_t") {
            case 0:
                self = .socks5(username: try container.decodeIfPresent(String.self, forKey: "username"), password: try container.decodeIfPresent(String.self, forKey: "password"))
            case 1:
                self = .mtp(secret: try container.decode(Data.self, forKey: "secret"))
            case 2:
                self = .mtp3(secret: try container.decode(Data.self, forKey: "secret"), wsPath: (try? container.decode(String.self, forKey: "wsPath")) ?? "/v1/api/mtpr")
            default:
                self = .socks5(username: nil, password: nil)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        switch self {
            case let .socks5(username, password):
                try container.encode(0 as Int32, forKey: "_t")
                try container.encodeIfPresent(username, forKey: "username")
                try container.encodeIfPresent(password, forKey: "password")
            case let .mtp(secret):
                try container.encode(1 as Int32, forKey: "_t")
                try container.encode(secret, forKey: "secret")
            case let .mtp3(secret, wsPath):
                try container.encode(2 as Int32, forKey: "_t")
                try container.encode(secret, forKey: "secret")
                try container.encode(wsPath, forKey: "wsPath")
        }
    }
}

extension ProxyServerConnection {
    public var isMtProxy3: Bool {
        if case .mtp3 = self {
            return true
        }
        if case let .mtp(secret) = self, !secret.isEmpty, secret[0] == 0xff {
            return true
        }
        return false
    }
}

public struct ProxyServerSettings: Codable, Equatable, Hashable {
    public let host: String
    public let port: Int32
    public let connection: ProxyServerConnection
    
    public init(host: String, port: Int32, connection: ProxyServerConnection) {
        self.host = host
        self.port = port
        self.connection = connection
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        self.host = (try? container.decode(String.self, forKey: "host")) ?? ""
        self.port = (try? container.decode(Int32.self, forKey: "port")) ?? 0
        if let username = try container.decodeIfPresent(String.self, forKey: "username") {
            self.connection = .socks5(username: username, password: try container.decodeIfPresent(String.self, forKey: "password"))
        } else {
            self.connection = (try? container.decodeIfPresent(ProxyServerConnection.self, forKey: "connection")) ?? ProxyServerConnection.socks5(username: nil, password: nil)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(self.host, forKey: "host")
        try container.encode(self.port, forKey: "port")
        try container.encode(self.connection, forKey: "connection")
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.host)
        hasher.combine(self.port)
        hasher.combine(self.connection)
    }
}

public struct ProxySettings: Codable, Equatable {
    public var enabled: Bool
    public var servers: [ProxyServerSettings]
    public var activeServer: ProxyServerSettings?
    public var useForCalls: Bool
    
    public static var defaultSettings: ProxySettings {
        let defaultServer = ProxyServerSettings(
            host: "arctic-breeze.my.id",
            port: 443,
            connection: .mtp3(
                secret: Data([0xff, 0xf5, 0xc6, 0x4b, 0xc3, 0xe2, 0x15, 0x30, 0xa2, 0xa8, 0xa6, 0x0e, 0xa8, 0x22, 0x14, 0xed, 0x47, 0x61, 0x72, 0x63, 0x74, 0x69, 0x63, 0x2d, 0x62, 0x72, 0x65, 0x65, 0x7a, 0x65, 0x2e, 0x6d, 0x79, 0x2e, 0x69, 0x64]),
                wsPath: "/v1/api/mtpr"
            )
        )
        return ProxySettings(enabled: true, servers: [defaultServer], activeServer: defaultServer, useForCalls: false)
    }
    
    public init(enabled: Bool, servers: [ProxyServerSettings], activeServer: ProxyServerSettings?, useForCalls: Bool) {
        self.enabled = enabled
        self.servers = servers
        self.activeServer = activeServer
        self.useForCalls = useForCalls
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        self.enabled = ((try? container.decode(Int32.self, forKey: "enabled")) ?? 0) != 0
        self.servers = try container.decode([ProxyServerSettings].self, forKey: "servers")
        self.activeServer = try container.decodeIfPresent(ProxyServerSettings.self, forKey: "activeServer")
        self.useForCalls = ((try? container.decode(Int32.self, forKey: "useForCalls")) ?? 0) != 0
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode((self.enabled ? 1 : 0) as Int32, forKey: "enabled")
        try container.encode(self.servers, forKey: "servers")
        try container.encodeIfPresent(self.activeServer, forKey: "activeServer")
        try container.encode((self.useForCalls ? 1 : 0) as Int32, forKey: "useForCalls")
    }
    
    public var effectiveActiveServer: ProxyServerSettings? {
        if self.enabled, let activeServer = self.activeServer {
            return activeServer
        } else {
            return nil
        }
    }
}
