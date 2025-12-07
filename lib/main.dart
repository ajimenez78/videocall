import 'package:flutter/material.dart';
import 'package:videocall/widgets/videocall_widget.dart';

void main() async {
  runApp(VideocallApp());
}

class VideocallApp extends StatelessWidget {
  const VideocallApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videocall App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Videocall App'),
        ),
        body: VideocallWidget(),
      ),
    );
  }
}