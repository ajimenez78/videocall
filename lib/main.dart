import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:videocall/pages/home_page.dart';
import 'package:videocall/pages/connect_page.dart';
import 'package:videocall/pages/prejoin_page.dart';
import 'package:videocall/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freerasp/freerasp.dart';
import 'firebase_options.dart';

// Import the firebase_app_check plugin
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    providerAndroid: AndroidDebugProvider(),
    providerApple: AppleDebugProvider()
  );
}

Future<void> initializeFreeRASP() async {

  // create a configuration for freeRASP
  final config = TalsecConfig(
    /// For Android
    androidConfig: AndroidConfig(
      packageName: 'your.package.name',
      signingCertHashes: [
        'mVr/qQLO8DKTwqlL+B1qigl9NoBnbiUs8b4c2Ewcz0k='
      ], // Replace with your release (!) signing certificate hash(es)
      supportedStores: ['com.sec.android.app.samsungapps'],
    ),

    /// For iOS
    iosConfig: IOSConfig(
      bundleIds: ['com.movilok.livekit.example'],
      teamId: 'GH7H7XQSUB',
    ),
    watcherMail: 'ajimenez@movilok.com', // for Security Reports, Talsec Portal, Updates
    isProd: false, // set to true for production builds
    killOnBypass: true,
  );
  
  // Setting up callbacks
  final callback = ThreatCallback(
      onAppIntegrity: () => {
        print('freeRASP callback: App integrity')
      },
      onObfuscationIssues: () => {
        print('freeRASP callback: Obfuscation issues')
      },
      onDebug: () => {
        print('freeRASP callback: Debugging')
      },
      onDeviceBinding: () => {
        print('freeRASP callback: Device binding')
      },
      onDeviceID: () => {
        print('freeRASP callback: Device ID')
      },
      onHooks: () => {
        print('freeRASP callback: Hooks')
      },
      onPasscode: () => {
        print('freeRASP callback: Passcode not set')
      },
      onPrivilegedAccess: () => {
        print('freeRASP callback: Privileged access')
      },
      onSecureHardwareNotAvailable: () => {
        print('freeRASP callback: Secure hardware not available')
      },
      onSimulator: () => {
        print('freeRASP callback: Simulator')
      },
      onSystemVPN: () => {
        print('freeRASP callback: System VPN')
      },
      onDevMode: () => {
        print('freeRASP callback: Developer mode')
      },
      onADBEnabled: () => {
        print('freeRASP callback: USB debugging enabled')
      },
      onUnofficialStore: () => {
        print('freeRASP callback: Unofficial store')
      },
      onScreenshot: () => {
        print('freeRASP callback: Screenshot')
      },
      onScreenRecording: () => {
        print('freeRASP callback: Screen recording')
      },
      onMultiInstance: () => {
        print('freeRASP callback: Multi instance')
      },
      onUnsecureWiFi: () => {
        print('freeRASP callback: Unsecure wifi')
      },
      onLocationSpoofing: () => {
        print('freeRASP callback: Location spoofing')
      },
      onTimeSpoofing: () => {
        print('freeRASP callback: Time spoofing')
      },
      onMalware: (suspiciousApps) => {
        print('freeRASP callback: Suspicous apps')
      }
  );

  // Attaching listener
  await Talsec.instance.attachListener(callback);// start freeRASP
  await Talsec.instance.start(config);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initializeFirebase();
  await initializeFreeRASP();
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