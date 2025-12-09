import 'dart:async';

import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/models/join_args.dart';

class RoomConnectionResult {
  RoomConnectionResult({required this.room, required this.listener});

  final Room room;
  final EventsListener<RoomEvent> listener;
}

class RoomService {
  /// Connects to a LiveKit room using the provided [JoinArgs].
  /// Optionally pass pre-created local tracks for fast connect.
  /// Returns a [RoomConnectionResult] with the connected Room and its listener.
  static Future<RoomConnectionResult> connectRoom(JoinArgs args, {LocalAudioTrack? audioTrack, LocalVideoTrack? videoTrack}) async {
    const cameraEncoding = VideoEncoding(
      maxBitrate: 5 * 1000 * 1000,
      maxFramerate: 30,
    );

    const screenEncoding = VideoEncoding(
      maxBitrate: 3 * 1000 * 1000,
      maxFramerate: 15,
    );

    E2EEOptions? e2eeOptions;
    if (args.e2ee && args.e2eeKey != null) {
      final keyProvider = await BaseKeyProvider.create();
      e2eeOptions = E2EEOptions(keyProvider: keyProvider);
      await keyProvider.setKey(args.e2eeKey!);
    }

    final room = Room(
      roomOptions: RoomOptions(
        adaptiveStream: args.adaptiveStream,
        dynacast: args.dynacast,
        defaultAudioPublishOptions: const AudioPublishOptions(
          name: 'custom_audio_track_name',
        ),
        defaultCameraCaptureOptions: const CameraCaptureOptions(
            maxFrameRate: 30,
            params: VideoParameters(
              dimensions: VideoDimensions(1280, 720),
            )),
        defaultScreenShareCaptureOptions: const ScreenShareCaptureOptions(
            useiOSBroadcastExtension: true,
            params: VideoParameters(
              dimensions: VideoDimensionsPresets.h1080_169,
            )),
        defaultVideoPublishOptions: VideoPublishOptions(
          simulcast: args.simulcast,
          videoCodec: args.preferredCodec,
          backupVideoCodec: BackupVideoCodec(
            enabled: args.enableBackupVideoCodec,
          ),
          videoEncoding: cameraEncoding,
          screenShareEncoding: screenEncoding,
        ),
        encryption: e2eeOptions,
      ),
    );

    final listener = room.createListener();

    await room.prepareConnection(args.url, args.token);

    await room.connect(
      args.url,
      args.token,
      fastConnectOptions: FastConnectOptions(
        microphone: TrackOption(track: audioTrack),
        camera: TrackOption(track: videoTrack),
      ),
    );

    return RoomConnectionResult(room: room, listener: listener);
  }
}
