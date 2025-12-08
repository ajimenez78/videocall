import 'package:flutter/material.dart';
import 'package:videocall/pages/connect_page.dart';
import 'package:videocall/pages/prejoin_page.dart';

const SERVER_URL = 'wss://meet.movilok.net'; // Replace with your LiveKit server URL
const TOKEN_ENDPOINT = 'http://localhost:3000/getToken'; // Replace with your token server URL
const SERVER_TOKEN = 'eyJhbGciOiJIUzI1NiJ9.eyJ2aWRlbyI6eyJyb29tSm9pbiI6dHJ1ZSwicm9vbSI6IjExMTEifSwiaXNzIjoiQVBJOXB1V252YzM1MmZHIiwiZXhwIjoxNzY1MjgzNjA4LCJuYmYiOjAsInN1YiI6IkFydHVybzIifQ.3fcVs2rT3MkHVF1derxPG58ykcn6r57muajigdmhL20'; // Optional: Pre-generated token for testing

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
                    url: SERVER_URL,
                    token: SERVER_TOKEN,
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