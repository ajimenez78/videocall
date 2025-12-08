import 'package:flutter/material.dart';
import 'package:videocall/pages/home_page.dart';
import 'package:videocall/pages/connect_page.dart';
import 'package:videocall/pages/prejoin_page.dart';

void main() async {
  runApp(VideocallApp());
}

class VideocallApp extends StatelessWidget {
  const VideocallApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videocall App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ConnectPage.routeName: (context) => ConnectPage(),
        PreJoinPage.routeName: (context) => PreJoinPage(),
      },
    );
  }
}