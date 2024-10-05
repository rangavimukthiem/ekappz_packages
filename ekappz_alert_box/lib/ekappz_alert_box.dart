///class CustomDialog extends StatelessWidget {
///   final String title;
//  /final String message;
///   final String buttonText;
///   final VoidCallback onPressed;
///   final double width;
///   final double height;
///   final double titleFontSize;
///   final Color titleColor;
///   final double bodyFontSize;
///   final Color bodyColor;
///   final double buttonFontSize;
///   final Color buttonTextColor;
///   final Color buttonColor;
///   final double buttonWidth;
///   final double buttonRadius;
///   final Duration autoHideDuration
///   final double? top;
///   final double? bottom;
///   final double? left;
///   final double? right;

import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final double titleFontSize;
  final Color titleColor;
  final double bodyFontSize;
  final Color bodyColor;
  final double buttonFontSize;
  final Color buttonTextColor;
  final Color buttonColor;
  final double buttonWidth;
  final double buttonRadius;
  final Duration autoHideDuration;

  // Position attributes
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const CustomDialog({
    super.key,
    this.title = "title",
    required this.message,
    this.buttonText = "",
    this.onPressed,
    this.width = 300,
    this.height = 100,
    this.titleFontSize = 20,
    this.titleColor = const Color.fromARGB(255, 230, 204, 204),
    this.bodyFontSize = 16,
    this.bodyColor = const Color.fromARGB(255, 29, 57, 242),
    this.buttonFontSize = 16,
    this.buttonTextColor = Colors.white,
    this.buttonColor = Colors.blue,
    this.buttonWidth = 30.0,
    this.buttonRadius = 8,
    this.autoHideDuration = const Duration(seconds: 3),
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
          child: AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                color: titleColor,
              ),
            ),
            content: SizedBox(
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: bodyFontSize,
                        color: bodyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonRadius),
                    ),
                  ),
                  onPressed: onPressed ??
                      () {
                        Navigator.of(context)
                            .pop(); // Default action: close the dialog
                      },
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: buttonFontSize,
                      color: buttonTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
