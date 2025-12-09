# Aplicación de Videollamadas - LiveKit Flutter

Esta aplicación implementa la demostración de una sala de video utilizando el SDK de Flutter de LiveKit. Está orientada a plataformas móviles y presenta una interfaz simplificada con respecto a los ejemplos que ofrece Livekit en su documentación

## Inicio Rápido

Ejecutar la aplicación:

```bash
flutter pub get
# Debido a la inconveniencia de escribir en dispositivos móviles,
# puedes autocompletar la URL y el TOKEN para la primera ejecución en modo debug.
flutter run
```

## Configuración
La demo es configurable mediante constantes de configuración contenidas en el archivo configuration/constants.dart

Las constantes de configuración más importantes son:

SERVER_URL = [URL del serviodor de Livekit al que conectarse]
TOKEN_ENDPOINT = [Endpoint del servicio de generación de tokens requeridos para la conexión]

Además, se han incluído otras constantes que modulan el comportamiento de la conexión de vídeo a través de Livekit, aunque no son objeto de esta demo:

### Cifrado extremo a extremo.
Todos los participantes deberían tener activado este valor y compartir la misma clave para soportar este tipo de comunicación

E2EE = [Valor booleano. Activa o desactova el cifrado extremo a extremo]
E2EEKEY = [Clave compartida de cifrado]

### Detalles de la configuración de vídeo
SIMULCAST = [Valor booleano. activa o desactiva la capacidad de usar múltioples codecs de vídeo de forma simultánea]
ADAPTATIVE_STREAM = [Valor booleano. Delega en Livecast el manejo automático de la calidad de vídeo para optimizarlo en función del ancho de banda y la CPU]
DYNACAST = [Valor booleano. Activa o desactiva el pausado automático de los streams que no estén siendo consumidos]
PREFERRED_CODEC = [Codec de víddeo preferido. ('VP8', 'H264', 'H265', 'VP9' o 'AV1')]

## Tareas pendientes
Extraer una librería para poder utilizar el componente de video en aplicaciones de terceros
