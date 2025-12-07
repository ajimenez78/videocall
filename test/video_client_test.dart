import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:videocall/main.dart';

void main() {
  testWidgets('VideocallApp exists and can be instantiated', (tester) async {
    // Create an instance of VideocallApp
    final app = VideocallApp();

    // Verify that VideocallApp is not null
    expect(app, isNotNull);

    // Verify that VideocallApp is a Widget
    expect(app, isA<Widget>());

    // Verify that VideocallApp is a StatelessWidget
    expect(app, isA<StatelessWidget>());
  });

  testWidgets('VideocallApp renders correctly', (tester) async {
    // Build the VideocallApp widget
    await tester.pumpWidget(VideocallApp());

    // Verify that the app title appears
    expect(find.text('Welcome to Videocall App'), findsOneWidget);

    // Verify that the VideocallWidget text appears
    expect(find.text('Videocall Widget'), findsOneWidget);
    expect(find.text('Ready to start your video call'), findsOneWidget);

    // Verify that the video call icon appears
    expect(find.byIcon(Icons.video_call), findsOneWidget);
  });
}
