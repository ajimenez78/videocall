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

  String get controlsSwitchSpeakerphone =>
      locale.languageCode == 'en' ? 'Switch SpeakerPhone' : 'Cambiar Altavoz';

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
