# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application implementing a video room using LiveKit's Flutter SDK. It's designed as a cross-platform videocall client supporting iOS, Android, Web, Mac, Windows, and Linux.

## Common Commands

### Development
```bash
# Install dependencies
flutter pub get

# Run the app (with optional autofill for URL and TOKEN in debug mode)
flutter run --dart-define=URL=wss://${LIVEKIT_SERVER_IP_OR_DOMAIN} --dart-define=TOKEN=${YOUR_TOKEN}

# Run with E2EE key
flutter run --dart-define=URL=wss://... --dart-define=TOKEN=... --dart-define=E2EEKEY=...
```

### Testing
```bash
# Run all tests
flutter test

# Run a single test file
flutter test test/video_client_test.dart
```

### Building
```bash
# Build for different platforms
flutter build apk              # Android
flutter build ios --release --no-codesign  # iOS
flutter build windows --release            # Windows
flutter build macos --release              # macOS
flutter build linux                        # Linux
flutter build web                          # Web
flutter build web --wasm                   # Web with WebAssembly

# Clean build artifacts
flutter clean
```

### E2EE Web Worker Compilation
```bash
# Compile E2EE worker for web support
dart compile js web/e2ee.worker.dart -o example/web/e2ee.worker.dart.js -m
```

## Architecture

### Application Flow

1. **ConnectPage** (`lib/pages/connect.dart`): Entry point where users configure connection settings
   - URL and token input
   - Feature toggles: E2EE, Simulcast, Adaptive Stream, Dynacast, Multi-codec
   - Settings are persisted via SharedPreferences
   - Permissions handling for Android (Bluetooth, Camera, Microphone)

2. **PreJoinPage** (`lib/pages/prejoin.dart`): Device selection before joining
   - Audio/video device enumeration and selection
   - Preview local camera feed
   - Configure video parameters (resolution: 480p to 1080p)
   - Creates Room instance with configured RoomOptions
   - Uses FastConnectOptions to pre-attach local tracks before connection

3. **RoomPage** (`lib/pages/room.dart`): Active video call interface
   - Main participant video (full screen)
   - Horizontal scrollable list of other participants (top of screen)
   - Control bar at bottom
   - Manages participant sorting by speaking activity, audio level, and join time
   - Screen shares are prioritized and shown first

### Key Components

**Participant Rendering** (`lib/widgets/participant.dart`):
- Abstract `ParticipantWidget` with `LocalParticipantWidget` and `RemoteParticipantWidget` implementations
- Factory method `widgetFor()` returns appropriate widget based on participant type
- Displays video track, audio waveform visualization, participant info, and optional stats
- Blue border indicates speaking participant
- Different controls for local vs remote (remote participants have subscribe/quality/FPS menus)

**Controls** (`lib/widgets/controls.dart`):
- Audio/video mute/unmute toggles
- Device switching menus (audio input/output, video input)
- Camera position toggle (front/back)
- Screen sharing (platform-specific implementations)
- Send data messages
- Simulate scenarios (for testing: reconnect, migration, E2EE key ratchet, etc.)
- Subscribe permission controls
- Android screen share requires background permission handling via FlutterBackground

**Extensions** (`lib/exts.dart`):
- Provides dialog helpers as BuildContext extensions
- Handles common UI flows: publish prompts, disconnect confirmations, error dialogs, data received notifications

### LiveKit SDK Integration

**Room Configuration**:
- RoomOptions includes: adaptive stream, dynacast, default publish options, E2EE encryption
- Video encodings: camera (5 Mbps, 30fps), screen share (3 Mbps, 15fps)
- E2EE uses BaseKeyProvider with shared key when enabled

**Event Handling**:
- EventsListener pattern for room and participant events
- Key events: RoomDisconnectedEvent, ParticipantEvent, TrackSubscribedEvent, DataReceivedEvent, AudioPlaybackStatusChanged
- Automatic reconnection with configurable retry logic
- iOS Safari requires manual audio playback activation

**Track Management**:
- Tracks differentiated by source type: camera, screen share, microphone
- ParticipantTrack model pairs participant with track type
- Simulcast support for adaptive quality streaming
- Backup video codec support for fallback scenarios

### Platform-Specific Considerations

- **Android**: Requires runtime permissions for Bluetooth, Camera, Microphone. Screen sharing needs FlutterBackground for foreground service notification.
- **Desktop**: Screen sharing shows native source picker dialog via DesktopCapturerSource.
- **Mobile Web**: Screen sharing not supported.
- **iOS Safari**: Audio playback requires user interaction to start.
- **Desktop**: Window close handler integrated to disconnect cleanly.

### State Management

- Uses Provider package for state management (dependency declared but not extensively used in current code)
- Participant and Room state changes trigger widget rebuilds via listeners
- Hardware device changes monitored via Hardware.instance.onDeviceChange stream

### Testing

Tests located in `test/` directory. Currently minimal test coverage with a placeholder test file (`video_client_test.dart`).

## Important Notes

- All participants in E2EE rooms must use the same shared key
- Video encoding quality and simulcast settings are configured at Room creation
- Participant sorting logic prioritizes: screen shares > speakers by audio level > last spoke time > video on > join time
- The app uses livekit_client package v2.5.4
- When modifying device-related code, test across platforms as behavior differs significantly
