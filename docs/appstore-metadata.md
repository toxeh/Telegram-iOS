# T3ChatM — App Store Metadata

## App Information

- **App Name:** T3ChatM
- **Subtitle:** Secure Messenger with Proxy
- **Bundle ID:** org.toxeh.ChatOverTSPU
- **Primary Category:** Social Networking
- **Secondary Category:** Utilities
- **Content Rating:** 17+ (Unrestricted Web Access)
- **Price:** Free
- **Version:** 1.0.0
- **Build:** 1

## App Store Description

### Short Description (Promotional Text, 170 chars)
Secure messaging with built-in proxy support. Stay connected when standard connections are unavailable. Full Telegram compatibility.

### Full Description (4000 chars max)

T3ChatM is a secure messaging client with advanced proxy connectivity features, built on the Telegram protocol.

**Stay Connected, Always**
When your internet connection is restricted or unreliable, T3ChatM keeps you connected through its built-in proxy support including the advanced MTProxy3 (WebSocket) transport protocol. This protocol tunnels your messages through standard HTTPS/WebSocket connections, making them indistinguishable from regular web traffic.

**Key Features**

- Full-featured messaging: text, voice, video, files, stickers, and more
- End-to-end encrypted Secret Chats
- Group chats and channels with unlimited members
- Voice and video calls
- MTProxy3 (WebSocket) proxy support for reliable connectivity
- Standard MTProxy (EE) proxy support
- SOCKS5 proxy support
- Built-in proxy configuration with easy setup
- Cross-platform message sync
- Cloud storage for messages, media, and files
- Night mode and customizable themes

**Advanced Proxy Features**

T3ChatM includes support for MTProxy3, an enhanced proxy protocol that wraps the MTProto protocol inside WebSocket frames over TLS connections. This provides:

- Reliable connectivity in restricted network environments
- Traffic that appears as standard HTTPS web browsing
- Simple proxy configuration: server, port, secret, and WebSocket path
- Proxy sharing via links for easy setup on other devices
- Automatic proxy connectivity testing with latency display

**Privacy and Security**

- Messages are encrypted in transit using the MTProto 2.0 protocol
- Secret Chats provide end-to-end encryption with self-destruct timers
- No ads, no tracking, no data selling
- Open source Telegram protocol

**Compatibility**

T3ChatM is fully compatible with the Telegram ecosystem. You can message any Telegram user, join any group or channel, and sync your conversations across all your devices.

### Keywords (100 chars max)
messenger,proxy,chat,secure,telegram,vpn,websocket,encrypted,private,messaging

### What's New (Version 1.0.0)
Initial release of T3ChatM with full messaging capabilities and MTProxy3 (WebSocket) proxy support for reliable connectivity in any network environment.

## App Review Information

### Notes for App Review
T3ChatM is a messaging client built on the open Telegram protocol (https://core.telegram.org/mtproto). It connects to the Telegram network and provides full messaging functionality. The proxy features allow users to configure proxy servers for connectivity in environments with network restrictions (such as corporate firewalls or regions with limited connectivity).

The MTProxy3 feature uses standard WebSocket over TLS connections (RFC 6455) to proxy Telegram traffic, which is a common and standard networking approach used by many applications for connectivity.

### Demo Account
- No demo account required. The app uses phone number authentication through the standard Telegram service.
- Reviewers can create a free account using any phone number.

## Privacy Policy

A privacy policy is required. It should cover:
- What data the app collects (phone number, contacts access, message content)
- How data is stored (Telegram cloud servers)
- Third-party services (Telegram API)
- Proxy data handling (proxy servers only relay encrypted traffic, no content access)
- Data retention and deletion

**TODO:** Host privacy policy at a public URL (e.g., https://toxeh.org/t3chatm/privacy or GitHub Pages)

## Screenshots Required

| Device | Size | Count |
|--------|------|-------|
| iPhone 6.9" (16 Pro Max) | 1320 x 2868 | 3-10 |
| iPhone 6.3" (16 Pro) | 1206 x 2622 | 3-10 |
| iPad Pro 13" | 2064 x 2752 | 3-10 |

Suggested screenshots:
1. Chat list (main screen)
2. Chat conversation view
3. Proxy settings with MTProxy3 configuration
4. Proxy connection successful
5. Secret chat with encryption indicator

## App Store Assets

| Asset | Size | Format |
|-------|------|--------|
| App Icon | 1024x1024 | PNG, no alpha, no rounded corners |
| Screenshots | See above | PNG or JPEG |

## Checklist Before Submission

- [ ] Apple Developer Program membership active ($99/year)
- [ ] App ID registered in Apple Developer portal
- [ ] Provisioning profile for distribution created
- [ ] Privacy policy hosted at public URL
- [ ] App icon finalized (no alpha channel, no rounded corners)
- [ ] Screenshots captured for all required device sizes
- [ ] App Store description finalized
- [ ] Version number set to 1.0.0
- [ ] Build uploaded via Xcode or Transporter
- [ ] App Review information filled in
- [ ] Age rating questionnaire completed
- [ ] Export compliance (uses encryption: Yes — standard HTTPS/TLS)
- [ ] Content rights confirmed
