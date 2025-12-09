import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:videocall/pages/home_page.dart';
import 'package:videocall/pages/connect_page.dart';
import 'package:videocall/pages/prejoin_page.dart';
import 'package:videocall/l10n/app_localizations.dart';

void main() async {
  runApp(VideocallApp());
}

class VideocallApp extends StatelessWidget {
  const VideocallApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videocall App',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('es', ''), // Spanish as default language
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ConnectPage.routeName: (context) => ConnectPage(),
        PreJoinPage.routeName: (context) => PreJoinPage(),
      },
    );
  }
}