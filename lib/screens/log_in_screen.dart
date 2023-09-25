import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_booking/services/supabase.dart';
import 'package:hotel_booking/utils/extensions.dart';
import 'package:hotel_booking/widgets/custom_log_container.dart';
import 'package:hotel_booking/widgets/custom_signin_button.dart';
import 'package:hotel_booking/widgets/custom_text.dart';
import 'package:hotel_booking/widgets/custom_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    // log('Token: ${supabase.auth.currentSession?.accessToken}');
    getBookings();
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
              child: CustomlogContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
