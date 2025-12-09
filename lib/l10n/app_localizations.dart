import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('es', ''),
    Locale('en', ''),
  ];

  // Home Page strings
  String get homeTitle => locale.languageCode == 'en'
      ? 'Medical Teleconsultation'
      : 'Teleconsulta Médica';

  String get homeHeading =>
      locale.languageCode == 'en' ? 'Telemedicine Portal' : 'Portal de Telemedicina';

  String get homeSubtitle => locale.languageCode == 'en'
      ? 'Connect with healthcare professionals through secure video consultations'
      : 'Conéctese con profesionales de la salud a través de videoconsultas seguras';

  String get homeButton =>
      locale.languageCode == 'en' ? 'Start Consultation' : 'Iniciar Consulta';

  // Connect Page strings
  String get connectTitle =>
      locale.languageCode == 'en' ? 'Welcome to Videocall App' : 'Bienvenido a la App de Videollamadas';

  String get connectHeading =>
      locale.languageCode == 'en' ? 'Join a Room' : 'Unirse a una Sala';

  String get connectRoomLabel =>
      locale.languageCode == 'en' ? 'Room Name' : 'Nombre de Sala';

  String get connectRoomHint =>
      locale.languageCode == 'en' ? 'Select a room' : 'Seleccione una sala';

  String get connectRoomError =>
      locale.languageCode == 'en' ? 'Please select a room' : 'Por favor seleccione una sala';

  String get connectUserLabel =>
      locale.languageCode == 'en' ? 'User Name' : 'Nombre de Usuario';

  String get connectUserHint =>
      locale.languageCode == 'en' ? 'Enter your name' : 'Ingrese su nombre';

  String get connectUserError =>
      locale.languageCode == 'en' ? 'Please enter your name' : 'Por favor ingrese su nombre';

  String get connectButton =>
      locale.languageCode == 'en' ? 'Join Room' : 'Unirse a la Sala';

  // VideocallWidget strings
  String get videocallWidgetTitle =>
      locale.languageCode == 'en' ? 'Videocall Widget' : 'Widget de Videollamada';

  String get videocallWidgetSubtitle =>
      locale.languageCode == 'en'
      ? 'Ready to start your video call'
      : 'Listo para iniciar su videollamada';

  // Error messages
  String get errorFetchToken =>
      locale.languageCode == 'en'
      ? 'Failed to fetch token'
      : 'Error al obtener el token';

  String get errorSeeConsole =>
      locale.languageCode == 'en'
      ? 'See console for more details'
      : 'Ver consola para más detalles';

  // PreJoin Page strings
  String get prejoinTitle =>
      locale.languageCode == 'en' ? 'Select Devices' : 'Seleccionar Dispositivos';

  String get prejoinCamera =>
      locale.languageCode == 'en' ? 'Camera:' : 'Cámara:';

  String get prejoinMicrophone =>
      locale.languageCode == 'en' ? 'Microphone:' : 'Micrófono:';

  String get prejoinDisableCamera =>
      locale.languageCode == 'en' ? 'Disable Camera' : 'Desactivar Cámara';

  String get prejoinDisableMicrophone =>
      locale.languageCode == 'en' ? 'Disable Microphone' : 'Desactivar Micrófono';

  String get prejoinSelectCamera =>
      locale.languageCode == 'en' ? 'Select Camera' : 'Seleccionar Cámara';

  String get prejoinSelectMicrophone =>
      locale.languageCode == 'en' ? 'Select Microphone' : 'Seleccionar Micrófono';

  String get prejoinSelectVideoDimensions =>
      locale.languageCode == 'en' ? 'Select Video Dimensions' : 'Seleccionar Dimensiones de Video';

  String get prejoinJoinButton =>
      locale.languageCode == 'en' ? 'JOIN' : 'UNIRSE';

  // Controls Widget strings
  String get controlsMuteAudio =>
      locale.languageCode == 'en' ? 'mute audio' : 'silenciar audio';

  String get controlsUnmuteAudio =>
      locale.languageCode == 'en' ? 'un-mute audio' : 'activar audio';

  String get controlsMuteMicrophone =>
      locale.languageCode == 'en' ? 'Mute Microphone' : 'Silenciar Micrófono';

  String get controlsDisableCamera =>
      locale.languageCode == 'en' ? 'Disable Camera' : 'Desactivar Cámara';

  String get controlsUnmuteVideo =>
      locale.languageCode == 'en' ? 'un-mute video' : 'activar video';

  String get controlsUnshareScreen =>
      locale.languageCode == 'en' ? 'unshare screen (experimental)' : 'dejar de compartir pantalla (experimental)';

  String get controlsShareScreen =>
      locale.languageCode == 'en' ? 'share screen (experimental)' : 'compartir pantalla (experimental)';

  String get controlsSendDemoData =>
      locale.languageCode == 'en' ? 'send demo data' : 'enviar datos de prueba';

  String get controlsDisconnect =>
      locale.languageCode == 'en' ? 'disconnect' : 'desconectar';

  // Dialog strings (exts.dart)
  // Publish Dialog
  String get dialogPublishTitle =>
      locale.languageCode == 'en' ? 'Publish' : 'Publicar';

  String get dialogPublishContent =>
      locale.languageCode == 'en'
      ? 'Would you like to publish your Camera & Mic ?'
      : '¿Desea publicar su Cámara y Micrófono?';

  // Play Audio Dialog
  String get dialogPlayAudioTitle =>
      locale.languageCode == 'en' ? 'Play Audio' : 'Reproducir Audio';

  String get dialogPlayAudioContent =>
      locale.languageCode == 'en'
      ? 'You need to manually activate audio PlayBack for iOS Safari !'
      : '¡Necesita activar manualmente la reproducción de audio para iOS Safari!';

  String get dialogPlayAudioButton =>
      locale.languageCode == 'en' ? 'Play Audio' : 'Reproducir Audio';

  // Unpublish Dialog
  String get dialogUnpublishTitle =>
      locale.languageCode == 'en' ? 'UnPublish' : 'Despublicar';

  String get dialogUnpublishContent =>
      locale.languageCode == 'en'
      ? 'Would you like to un-publish your Camera & Mic ?'
      : '¿Desea despublicar su Cámara y Micrófono?';

  // Error Dialog
  String get dialogErrorTitle =>
      locale.languageCode == 'en' ? 'Error' : 'Error';

  // Disconnect Dialog
  String get dialogDisconnectTitle =>
      locale.languageCode == 'en' ? 'Disconnect' : 'Desconectar';

  String get dialogDisconnectContent =>
      locale.languageCode == 'en'
      ? 'Are you sure to disconnect?'
      : '¿Está seguro de desconectarse?';

  String get dialogDisconnectButton =>
      locale.languageCode == 'en' ? 'Disconnect' : 'Desconectar';

  // Reconnect Dialog
  String get dialogReconnectTitle =>
      locale.languageCode == 'en' ? 'Reconnect' : 'Reconectar';

  String get dialogReconnectContent =>
      locale.languageCode == 'en'
      ? 'This will force a reconnection'
      : 'Esto forzará una reconexión';

  String get dialogReconnectButton =>
      locale.languageCode == 'en' ? 'Reconnect' : 'Reconectar';

  String get dialogReconnectSuccessContent =>
      locale.languageCode == 'en'
      ? 'Reconnection was successful.'
      : 'La reconexión fue exitosa.';

  // Send Data Dialog
  String get dialogSendDataTitle =>
      locale.languageCode == 'en' ? 'Send data' : 'Enviar datos';

  String get dialogSendDataContent =>
      locale.languageCode == 'en'
      ? 'This will send a sample data to all participants in the room'
      : 'Esto enviará datos de ejemplo a todos los participantes en la sala';

  String get dialogSendDataButton =>
      locale.languageCode == 'en' ? 'Send' : 'Enviar';

  // Data Received Dialog
  String get dialogDataReceivedTitle =>
      locale.languageCode == 'en' ? 'Received data' : 'Datos recibidos';

  // Recording Status Dialog
  String get dialogRecordingTitle =>
      locale.languageCode == 'en' ? 'Room recording reminder' : 'Recordatorio de grabación de sala';

  String get dialogRecordingActive =>
      locale.languageCode == 'en'
      ? 'Room recording is active.'
      : 'La grabación de la sala está activa.';

  String get dialogRecordingStopped =>
      locale.languageCode == 'en'
      ? 'Room recording is stopped.'
      : 'La grabación de la sala se ha detenido.';

  // Subscribe Permission Dialog
  String get dialogSubscribePermissionTitle =>
      locale.languageCode == 'en' ? 'Allow subscription' : 'Permitir suscripción';

  String get dialogSubscribePermissionContent =>
      locale.languageCode == 'en'
      ? 'Allow all participants to subscribe tracks published by local participant?'
      : '¿Permitir que todos los participantes se suscriban a las pistas publicadas por el participante local?';

  // Simulate Scenario Dialog
  String get dialogSimulateScenarioTitle =>
      locale.languageCode == 'en' ? 'Simulate Scenario' : 'Simular Escenario';

  // Common dialog buttons
  String get dialogButtonYes =>
      locale.languageCode == 'en' ? 'YES' : 'SÍ';

  String get dialogButtonNo =>
      locale.languageCode == 'en' ? 'NO' : 'NO';

  String get dialogButtonOk =>
      locale.languageCode == 'en' ? 'OK' : 'OK';

  String get dialogButtonCancel =>
      locale.languageCode == 'en' ? 'Cancel' : 'Cancelar';

  String get dialogButtonIgnore =>
      locale.languageCode == 'en' ? 'Ignore' : 'Ignorar';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
