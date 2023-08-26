import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/extensions.dart';
import 'package:hotel_booking/widgets/custom_signin_button.dart';
import 'package:hotel_booking/widgets/custom_text.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
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
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      CoustomTextField(
                        Hinttext: 'GGG@gmail.com',
                        icon: Icon(Icons.login),
                        text: 'Email',
                        isObscure: false,
                      ),
                      CoustomTextField(
                        Hinttext: 'password',
                        icon: Icon(Icons.wifi_password_outlined),
                        text: 'password',
                        isObscure: true,
                      ),
                      CustomLogInButton(
                        buttonColor: Colors.blue,
                        text: 'Sign In',
                        textColor: Colors.white,
                      ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
