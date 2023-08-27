import 'package:flutter/material.dart';
import 'package:hotel_booking/screens/sign_up_screen.dart';
import 'package:hotel_booking/utils/extensions.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account?"),
        InkWell(
          onTap: () {
            SignUpScreen().push(context);
          }, // navigation to sign up page
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
