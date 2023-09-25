import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_booking/screens/explor_screen.dart';
import 'package:hotel_booking/screens/sign_up_screen.dart';
import 'package:hotel_booking/screens/view_screen.dart';
import 'package:hotel_booking/utils/extensions.dart';
import 'package:hotel_booking/widgets/custom_signin_button.dart';
import 'package:hotel_booking/widgets/custom_text.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomlogContainer extends StatefulWidget {
  const CustomlogContainer({
    super.key,
  });

  @override
  State<CustomlogContainer> createState() => _CustomlogContainerState();
}

class _CustomlogContainerState extends State<CustomlogContainer> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    log('Token: ${supabase.auth.currentSession?.accessToken}');
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CoustomTextField(
              Hinttext: 'GGG@gmail.com',
              icon: Icon(Icons.login),
              text: 'Email',
              isObscure: false,
              controller: emailController,
            ),
            CoustomTextField(
              Hinttext: 'password',
              icon: Icon(Icons.wifi_password_outlined),
              text: 'password',
              isObscure: true,
              controller: passwordController,
            ),
            CustomLogInButton(
                buttonColor: Colors.blue,
                text: 'Sign In',
                textColor: Colors.white,
                onTap: () async {
                  if ((emailController.text.isNotEmpty &&
                          emailController.text.isValidEmail) &&
                      passwordController.text.isNotEmpty) {
                    // Signing in ...
                    await supabase.auth.signInWithPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    //   Popping the screen after signing in
                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewScreen()),
                          (route) {
                        return false;
                      });
                    }
                  }
                }),
            CustomTextWidget(),
            CustomLogInButton(
              buttonColor: Colors.white,
              text: 'Continue with phone number',
              textColor: Colors.black,
            ),
            CustomLogInButton(
              buttonColor: Colors.white,
              text: 'continue with google',
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
