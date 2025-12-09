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

    // Verify that the HomePage title appears
    expect(find.text('Medical Teleconsultation'), findsOneWidget);

    // Verify that the welcome message appears
    expect(find.text('Telemedicine Portal'), findsOneWidget);
    expect(find.text('Connect with healthcare professionals through secure video consultations'), findsOneWidget);

    // Verify that the medical services icon appears
    expect(find.byIcon(Icons.medical_services), findsOneWidget);

    // Verify that the video call icon appears in the button
    expect(find.byIcon(Icons.video_call), findsOneWidget);

    // Verify that the "Start Consultation" button appears
    expect(find.text('Start Consultation'), findsOneWidget);
  });
}
