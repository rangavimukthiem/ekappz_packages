import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ekappz_alert_box/ekappz_alert_box.dart'; // Replace with actual path of your package

void main() {
  testWidgets('CustomDialog shows title, message, and button correctly',
      (WidgetTester tester) async {
    // Variables to test if button is pressed
    bool buttonPressed = false;

    // Build the CustomDialog inside a MaterialApp for testing
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomDialog(
            title: 'Test Title',
            message: 'Test message content',
            buttonText: 'Confirm',
            onPressed: () {
              buttonPressed = true; // Change state when button is pressed
            },
            width: 300,
            height: 200,
            titleFontSize: 22,
            titleColor: Colors.red,
            bodyFontSize: 16,
            bodyColor: Colors.black,
            buttonFontSize: 14,
            buttonTextColor: Colors.white,
            buttonColor: Colors.blue,
            buttonWidth: 100,
            buttonRadius: 8,
            top: 50,
            left: 50,
          ),
        ),
      ),
    );

    // Verify that the title is displayed
    expect(find.text('Test Title'), findsOneWidget);

    // Verify that the message is displayed
    expect(find.text('Test message content'), findsOneWidget);

    // Verify that the button with the label 'Confirm' is displayed
    expect(find.text('Confirm'), findsOneWidget);

    // Tap the button and trigger the onPressed function
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Check if the button press has updated the state
    expect(buttonPressed, isTrue);
  });
}
