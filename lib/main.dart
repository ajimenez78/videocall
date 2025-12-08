import 'package:flutter/material.dart';
import 'package:videocall/configuration/constants.dart';
import 'package:videocall/pages/connect_page.dart';
import 'package:videocall/pages/prejoin_page.dart';

void main() async {
  runApp(VideocallApp());
}

class VideocallApp extends StatelessWidget {
  const VideocallApp({super.key});


  final bool _e2ee = false;
  final String e2eeKey = '';
  final bool _simulcast = true;
  final bool _adaptiveStream = true;
  final bool _dynacast = true;
  final String _preferredCodec = 'VP8';

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videocall App',
      initialRoute: ConnectPage.routeName,
      routes: {
        ConnectPage.routeName: (context) => ConnectPage(),
        PreJoinPage.routeName: (context) => PreJoinPage(
          args: JoinArgs(
                    url: Constants.SERVER_URL,
                    token: Constants.SERVER_TOKEN,
                    e2ee: _e2ee,
                    e2eeKey: e2eeKey,
                    simulcast: _simulcast,
                    adaptiveStream: _adaptiveStream,
                    dynacast: _dynacast,
                    preferredCodec: _preferredCodec,
                    enableBackupVideoCodec: ['VP9', 'AV1'].contains(_preferredCodec),
                  ),
        ),
      },
    );
  }
}