# Servicios de `lib/services`

Este documento explica los servicios añadidos en `lib/services`: `TokenService` y `RoomService`.

## Propósito
- `TokenService`: Encapsula la llamada HTTP al endpoint que emite tokens temporales para conectar con LiveKit.
- `RoomService`: Encapsula la creación, preparación y conexión a una `Room` de LiveKit, devolviendo la instancia `Room` y su `EventsListener`.

Separar estas responsabilidades de la UI facilita pruebas, mantenimiento y reutilización desde otras pantallas o flujos.

## Archivos
- `token_service.dart` — `TokenService.fetchToken({required String room, required String username})`.
- `room_service.dart` — `RoomService.connectRoom(JoinArgs args, {LocalAudioTrack? audioTrack, LocalVideoTrack? videoTrack})`.
- `models/join_args.dart` — Modelo `JoinArgs` que contiene la URL, token y flags de conexión.

## Uso (ejemplos)

1) Obtener token desde una pantalla (ej. `ConnectPage`):

```dart
final token = await TokenService.fetchToken(room: roomName, username: userName);
```

2) Conectar a una sala (ej. `PreJoinPage`) pasando tracks locales optimizados:

```dart
final result = await RoomService.connectRoom(
  joinArgs,
  audioTrack: localAudioTrack,
  videoTrack: localVideoTrack,
);

// Navegar a la pantalla de sala con result.room y result.listener
Navigator.push(context, MaterialPageRoute(
  builder: (_) => RoomPage(result.room, result.listener),
));
```

Ejemplo rápido para ejecutar tests en el repo:

```bash
flutter test test/token_service_test.dart
```
