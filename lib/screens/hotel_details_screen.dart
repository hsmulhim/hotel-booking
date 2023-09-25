import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/spacings.dart';
import 'package:hotel_booking/models/bookings_model.dart';
import 'package:hotel_booking/models/hotels_model.dart';
import 'package:hotel_booking/screens/home_screen.dart';
import 'package:hotel_booking/screens/my_bookings.dart';
import 'package:hotel_booking/services/supabase.dart';
import 'package:hotel_booking/utils/extensions.dart';
import 'package:hotel_booking/widgets/custom_signin_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class HoteleDetilesScreen extends StatefulWidget {
  const HoteleDetilesScreen({super.key, required this.hotel, this.booking});

  final Hotels hotel;
  final Bookings? booking;

  @override
  State<HoteleDetilesScreen> createState() => _HoteleDetilesScreenState();
}

class _HoteleDetilesScreenState extends State<HoteleDetilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.network(widget.hotel.image!,
                height: 300, fit: BoxFit.fill, width: context.width),
          ),
          Positioned(
            top: 50,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {
                context.pop();
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              height: context.height * 0.67,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.hotel.name!,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(Icons.favorite_border_outlined),
                      ],
                    ),
                    kVSpace32,
                    Text(
                      'Location: ${widget.hotel.city}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    kVSpace32,
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    kVSpace8,
                    Text(
                      '${widget.hotel.description}',
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    kVSpace64,
                    Text(
                      "${widget.hotel.roomPrice}\$ /night",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    kVSpace16,
                    CustomLogInButton(
                      buttonColor: Colors.blue,
                      textColor: Colors.white,
                      text: "add booking",
                      onTap: () async {
                        final id = const Uuid().v4();
                        // final Bookings booking = Bookings(
                        //   userId: Supabase.instance.client.auth.currentUser!.id,
                        //   id: id,
                        //   hotelName: widget.hotel.name,
                        //   city: widget.hotel.city,
                        //   image: widget.hotel.image,
                        //   daysNumber: widget.hotel.roomsAvailable,
                        //   roomPrice: widget.hotel.roomPrice,
                        // );
                        //  bookingsModel.add(widget.booking!);
                        log('${bookingsModel.length}');

                        Map bookingHotel = {
                          "user_id":
                              Supabase.instance.client.auth.currentUser!.id,
                          "hotel_name": widget.hotel.name,
                          "days_number": widget.hotel.roomsAvailable,
                          "image": widget.hotel.image,
                          "city": widget.hotel.city,
                          "description": widget.hotel.description,
                          "room_price": widget.hotel.roomPrice,
                          "hotel_id": widget.hotel.hotelId,
                        };

                        await insertBooking(bookingHotel);
                        MyBookingsScreen().push(context);
                        if (context.mounted) {
                          Navigator.pop;
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
