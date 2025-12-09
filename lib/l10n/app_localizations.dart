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
