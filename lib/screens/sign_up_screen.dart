import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_booking/screens/view_screen.dart';
import 'package:hotel_booking/utils/extensions.dart';
import 'package:hotel_booking/widgets/custom_log_container.dart';
import 'package:hotel_booking/widgets/custom_signin_button.dart';
import 'package:hotel_booking/widgets/custom_text.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    log('Token: ${supabase.auth.currentSession?.accessToken}');
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height),
            Container(
                child: Image.asset(
              "assets/images/10.png",
              fit: BoxFit.cover,
            )),
            Positioned(
              top: 245,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      CoustomTextField(
                        Hinttext: 'hessah salah',
                        icon: Icon(Icons.person),
                        text: 'user name',
                        isObscure: false,
                        controller: nameController,
                      ),
                      CoustomTextField(
                        Hinttext: 'GGG@gmail.com',
                        icon: Icon(Icons.email),
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
                      CoustomTextField(
                        Hinttext: 'password',
                        icon: Icon(Icons.wifi_password_outlined),
                        text: 'Confirm password',
                        isObscure: true,
                        controller: confirmPasswordController,
                      ),
                      CustomLogInButton(
                        buttonColor: Colors.blue,
                        textColor: Colors.white,
                        text: "Sign Up",
                        onTap: () async {
                          if ((emailController.text.isNotEmpty &&
                                  emailController.text.isValidEmail) &&
                              passwordController.text.isNotEmpty) {
                            // Signing up ...
                            await supabase.auth.signUp(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            // Pop after signing up
                            if (context.mounted) {
                              context.pop;
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
