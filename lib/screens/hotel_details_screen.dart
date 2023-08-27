import 'package:flutter/material.dart';
import 'package:hotel_booking/constants/spacings.dart';
import 'package:hotel_booking/models/hotels_model.dart';
import 'package:hotel_booking/utils/extensions.dart';
import 'package:hotel_booking/widgets/custom_signin_button.dart';

class HoteleDetilesScreen extends StatelessWidget {
  const HoteleDetilesScreen({super.key, required this.hotel});

  final Hotels hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.network(hotel.image!,
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
                            hotel.name!,
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
                      'Location: ${hotel.city}',
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
                      '${hotel.description}',
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    kVSpace64,
                    Text(
                      "${hotel.roomPrice}\$ /night",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    kVSpace16,
                    CustomLogInButton(
                      buttonColor: Colors.blue,
                      textColor: Colors.white,
                      text: "add booking",
                      onTap: () {},
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
