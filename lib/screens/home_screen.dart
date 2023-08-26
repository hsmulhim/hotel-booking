import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hotel_booking/models/hotels_model.dart';
import 'package:hotel_booking/screens/log_in_screen.dart';
import 'package:hotel_booking/services/supabase.dart';

List<Hotels> hotelsModel = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen()),
                );
              },
              icon: Icon(Icons.login_outlined)),
        ],
      ),
      body: FutureBuilder(
        future: getHotels(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == null &&
              snapshot.connectionState == ConnectionState.none) {
            log("wrong");
          }
          return ListView.builder(
              itemCount: snapshot.data.length ?? 0,
              itemBuilder: (context, index) {
                final Hotels hotel = snapshot.data[index];
                return Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    children: [
                      Text(hotel.name ?? "t"),
                    ],
                  ),
                );
              });
        }),
      ),
    );
  }
}
