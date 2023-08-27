import 'package:flutter/material.dart';

class CustomLogInButton extends StatelessWidget {
  const CustomLogInButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.onTap,
  });

  final Color buttonColor;
  final Color textColor;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
