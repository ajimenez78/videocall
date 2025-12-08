import 'package:flutter/material.dart';
import 'package:videocall/pages/connect_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videocall Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.video_call,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 32),
              Text(
                'Welcome to Videocall App',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Connect with others through high-quality video calls',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48),
              ElevatedButton.icon(
                onPressed: () async {
                  await Navigator.pushNamed(context, ConnectPage.routeName);
                },
                icon: Icon(Icons.login),
                label: Text('Join a Call'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
