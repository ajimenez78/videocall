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

## Notas de seguridad y configuración
- Asegúrate de que `Constants.TOKEN_ENDPOINT` use HTTPS en producción para proteger el token en tránsito.
- Nunca guardes claves E2EE en código fuente; usa un almacén seguro o un servicio de gestión de secretos.
- Valida y sanea cualquier dato proveniente del servidor antes de usarlo en la UI.

## Manejo de errores
- Ambos servicios lanzan `Exception` en errores de red o respuestas inválidas. El llamador debe atraparlas y mostrar errores amigables (diálogos, toasts) y/o proporcionar acciones (reintentar).

## Tests recomendados
- Test unitario para `TokenService.fetchToken` usando un mock de `http.Client` que simule respuestas 200 con JSON y respuestas de error.
- Test de integración/mocks para `RoomService.connectRoom` que verifique el flujo de creación del `Room` y manejo de opciones. Dado que `livekit_client` interactúa con native bindings, se recomienda usar pruebas con mocks o abstraer más la capa de SDK para facilitar pruebas.

Ejemplo rápido para ejecutar tests en el repo:

```bash
flutter test test/token_service_test.dart
```

## Próximos pasos sugeridos
- Añadir un `TokenRepository` que permita inyectar el `TOKEN_ENDPOINT` (útil para tests y entornos).
- Añadir logs estructurados y métricas (tiempos de respuesta token, errores de conexión).
- Crear tests unitarios y de integración para ambos servicios.

---
Si quieres, puedo añadir automáticamente un test unitario de ejemplo para `TokenService` ahora.
