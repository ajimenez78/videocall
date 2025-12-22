import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:videocall/pages/home_page.dart';
import 'package:videocall/pages/connect_page.dart';
import 'package:videocall/pages/prejoin_page.dart';
import 'package:videocall/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Import the firebase_app_check plugin
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    providerAndroid: AndroidDebugProvider(),
    providerApple: AppleDebugProvider()
  );
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