import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_booking/models/bookings_model.dart';
import 'package:hotel_booking/models/hotels_model.dart';
import 'package:hotel_booking/screens/home_screen.dart';
import 'package:hotel_booking/screens/hotel_details_screen.dart';
import 'package:hotel_booking/services/supabase.dart';
import 'package:hotel_booking/utils/extensions.dart';

import 'package:hotel_booking/widgets/custom_cities_cards.dart';
import 'package:hotel_booking/widgets/custom_label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  late Hotels hotel;
  late Bookings booking;
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 245,
                color: Colors.blue,
              ),
              Positioned(
                top: 90,
                left: 30,
                child: Text(supabase.auth.currentUser!.email ?? "",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              Positioned(
                  top: 8, left: 180, child: Image.asset('assets/images/1.png')),
              Padding(
                padding: const EdgeInsets.only(top: 185, left: 20, right: 20),
                child: Positioned(
                  top: 185,
                  left: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      hintText: 'Where do you want to stay ',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                customLabel(firstText: 'Popular Cities', secondText: 'see all'),
          ),
          // Cities(),

          FutureBuilder(
            future: getHotels(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == null &&
                  snapshot.connectionState == ConnectionState.none) {
                log("wrong");
              }
              return Column(
                children: [
                  // Row(
                  //   children: [
                  //     ListView.builder(
                  //       itemCount: hotel.city!.length ?? hotelsModel.length,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Column(
                  //           children: [
                  //             Container(
                  //               height: 20,
                  //               width: 20,
                  //               decoration: BoxDecoration(
                  //                 shape: BoxShape.circle,
                  //               ),
                  //               child: Text('${hotel.city}'),
                  //             )
                  //           ],
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: context.width,
                    height: context.height * 0.63,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 250,
                        ),
                        itemCount: hotelsModel.length,
                        itemBuilder: (context, index) {
                          final Hotels hotel = snapshot.data[index];
                          return InkWell(
                            onTap: () {
                              HoteleDetilesScreen(hotel: hotel).push(context);
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        '${hotel.image}',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${hotel.name}',
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
                                        "${hotel.roomPrice}\$ /night",
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
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
