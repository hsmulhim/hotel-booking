import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_booking/models/bookings_model.dart';
import 'package:hotel_booking/models/hotels_model.dart';
import 'package:hotel_booking/screens/home_screen.dart';
import 'package:hotel_booking/screens/hotel_details_screen.dart';
import 'package:hotel_booking/screens/view_screen.dart';
import 'package:hotel_booking/services/supabase.dart';
import 'package:hotel_booking/utils/extensions.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF476bfe),
        title: const Text("Book Room"),
      ),
      body: FutureBuilder(
        future: getBookings(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == null &&
              snapshot.connectionState == ConnectionState.none) {
            log("wrong");
          }
          return Container(
            padding: EdgeInsets.all(8),
            width: context.width,
            height: context.height,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 250,
                ),
                itemCount: bookingsModel.length,
                itemBuilder: (context, index) {
                  final Bookings booking = snapshot.data[index];
                  return InkWell(
                    onTap: () {
                      deleteCourse(booking.id!);
                      setState(() {});
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                                // "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
                                '${booking.image}',
                              ),
                            ),
                          ),
                          Text(
                            '${booking.hotelName}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "${booking.roomPrice}\$ /night " ??
                                    " 0\$ /night",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
