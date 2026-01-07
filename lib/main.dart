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

// Global key for showing toasts
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Helper function to show toast
void showToast(String message, {bool isWarning = true}) {
  final context = navigatorKey.currentContext;
  if (context != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isWarning ? Colors.orange : Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// Helper function to show alert dialog
void showSecurityAlert(String title, String message) {
  final context = navigatorKey.currentContext;
  if (context != null) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.red),
              SizedBox(width: 8),
              Text(title),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

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
  print('=== FreeRASP: Starting initialization ===');

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
    isProd: true, // set to true for production builds
    killOnBypass: false, // Set to true for production - false for debugging
  );
  
  // Setting up callbacks
  final callback = ThreatCallback(
      onAppIntegrity: () {
        print('freeRASP callback: App integrity');
        showToast('Security Alert: App integrity compromised');
      },
      onObfuscationIssues: () {
        print('freeRASP callback: Obfuscation issues');
        showToast('Security Alert: Obfuscation issues detected');
      },
      onDebug: () {
        print('freeRASP callback: Debugging');
        showToast('Security Alert: Debugger detected');
      },
      onDeviceBinding: () {
        print('freeRASP callback: Device binding');
        showToast('Security Alert: Device binding issue');
      },
      onDeviceID: () {
        print('freeRASP callback: Device ID');
        showToast('Security Alert: Device ID mismatch');
      },
      onHooks: () {
        print('freeRASP callback: Hooks');
        showToast('Security Alert: Hooks detected');
      },
      onPasscode: () {
        print('freeRASP callback: Passcode not set');
        showToast('Security Warning: Passcode not set', isWarning: true);
      },
      onPrivilegedAccess: () {
        print('freeRASP callback: Privileged access');
        showSecurityAlert(
          'Security Alert',
          'Privileged access (root/jailbreak) has been detected on this device. This poses a significant security risk and may compromise the app\'s security features.'
        );
      },
      onSecureHardwareNotAvailable: () {
        print('freeRASP callback: Secure hardware not available');
        showToast('Security Warning: Secure hardware not available', isWarning: true);
      },
      onSimulator: () {
        print('freeRASP callback: Simulator');
        showToast('Security Alert: Running on simulator');
      },
      onSystemVPN: () {
        print('freeRASP callback: System VPN');
        showToast('Security Warning: System VPN detected', isWarning: true);
      },
      onDevMode: () {
        print('freeRASP callback: Developer mode');
        showToast('Security Alert: Developer mode enabled');
      },
      onADBEnabled: () {
        print('freeRASP callback: USB debugging enabled');
        showToast('Security Alert: USB debugging enabled');
      },
      onUnofficialStore: () {
        print('freeRASP callback: Unofficial store');
        showSecurityAlert(
          'Security Alert',
          'This app was installed from an unofficial store. For your security, please install the app only from official app stores (Google Play Store or Apple App Store).'
        );
      },
      onScreenshot: () {
        print('freeRASP callback: Screenshot');
        showToast('Security Alert: Screenshot detected');
      },
      onScreenRecording: () {
        print('freeRASP callback: Screen recording');
        showToast('Security Alert: Screen recording detected');
      },
      onMultiInstance: () {
        print('freeRASP callback: Multi instance');
        showToast('Security Alert: Multiple instances detected');
      },
      onUnsecureWiFi: () {
        print('freeRASP callback: Unsecure wifi');
        showToast('Security Warning: Unsecure WiFi connection', isWarning: true);
      },
      onLocationSpoofing: () {
        print('freeRASP callback: Location spoofing');
        showToast('Security Alert: Location spoofing detected');
      },
      onTimeSpoofing: () {
        print('freeRASP callback: Time spoofing');
        showToast('Security Alert: Time spoofing detected');
      },
      onMalware: (suspiciousApps) {
        print('freeRASP callback: Suspicious apps');
        showToast('Security Alert: Malware or suspicious apps detected');
      }
  );

  // Attaching listener
  print('=== FreeRASP: Attaching listener ===');
  await Talsec.instance.attachListener(callback);

  // start freeRASP
  print('=== FreeRASP: Starting with config ===');
  try {
    await Talsec.instance.start(config);
    print('=== FreeRASP: Successfully started ===');
  } catch (e) {
    print('=== FreeRASP: Error during start: $e ===');
    rethrow;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initializeFirebase();
  runApp(VideocallApp());
  await initializeFreeRASP();
}

class VideocallApp extends StatelessWidget {
  const VideocallApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videocall App',
      navigatorKey: navigatorKey,
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