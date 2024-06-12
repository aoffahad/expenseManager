import 'package:flutter/material.dart';

import '../../core/constance/color_constance.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final VoidCallback buttonCallback;

  const CustomElevatedButton(
      {super.key,
      required this.text,
      this.backgroundColor,
      this.foregroundColor,
      this.textStyle,
      required this.buttonCallback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => buttonCallback.call(),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorConstant.primaryColor,
          foregroundColor: foregroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Add rounded corners
          ),
          padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
          // Adjust padding
          elevation: 5.0,
          shadowColor: Colors.black,
        ),
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
