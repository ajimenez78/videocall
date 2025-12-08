import 'package:flutter/material.dart';
import 'package:videocall/widgets/videocall_widget.dart';
import 'package:videocall/pages/prejoin_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Videocall App'),
      ),
      body: Column(
        children: [
          Expanded(child: VideocallWidget()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed(context, PreJoinPage.routeName);
              },
              child: Text('Go to Pre-Join'),
            ),
          ),
        ],
      ),
    );
  }
}
