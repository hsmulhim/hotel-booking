import 'package:flutter/material.dart';
import 'package:hotel_booking/screens/welcome_screen.dart';
import 'package:hotel_booking/utils/extensions.dart';

import 'package:hotel_booking/widgets/custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              width: double.infinity,
              height: 800,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
            ),
          ),
          Positioned(top: 110, left: 10, child: Text("Location")),
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 12, right: 12),
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 1,
                      vertical: 1,
                    ),
                    prefixIcon: const Icon(Icons.room),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // borderSide: const BorderSide(),
                    ))),
          ),
          Positioned(top: 200, left: 10, child: Text("Room")),
          Padding(
            padding: const EdgeInsets.only(top: 220, left: 12, right: 12),
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 1,
                      vertical: 1,
                    ),
                    prefixIcon: const Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // borderSide: const BorderSide(),
                    ))),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 290, left: 15),
          //   child: ElevatedButton(
          //       style: buttonPrimary, onPressed: () {}, child: Text("Search")),
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 290, left: 15),
            child: ElevatedButton(
                style: buttonPrimary,
                onPressed: () async {
                  await supabase.auth.signOut();
                  WelcomeScreen().push(context);
                },
                child: Text("logout")),
          ),
        ]));
  }
}
