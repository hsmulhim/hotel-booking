import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/spacings.dart';

class CoustomTextField extends StatelessWidget {
  const CoustomTextField({
    super.key,
    required this.text,
    required this.Hinttext,
    required this.icon,
    this.isObscure,
  });
  final String text;
  final String Hinttext;
  final Icon icon;
  final bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 16.0, color: Colors.grey, fontStyle: FontStyle.italic),
        ),
        kVSpace8,
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: Hinttext,
            border: OutlineInputBorder(),
          ),
          obscureText: isObscure! ? true : false,
        ),
      ],
    );
  }
}
