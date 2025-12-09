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
    await tester.pumpAndSettle();

    // Verify that the HomePage title appears (in Spanish)
    expect(find.text('Teleconsulta Médica'), findsOneWidget);

    // Verify that the welcome message appears (in Spanish)
    expect(find.text('Portal de Telemedicina'), findsOneWidget);
    expect(find.text('Conéctese con profesionales de la salud a través de videoconsultas seguras'), findsOneWidget);

    // Verify that the medical services icon appears
    expect(find.byIcon(Icons.medical_services), findsOneWidget);

    // Verify that the video call icon appears in the button
    expect(find.byIcon(Icons.video_call), findsOneWidget);

    // Verify that the "Start Consultation" button appears (in Spanish)
    expect(find.text('Iniciar Consulta'), findsOneWidget);
  });
}
