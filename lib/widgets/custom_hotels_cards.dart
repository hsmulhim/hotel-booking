import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/models/hotels_model.dart';

class CustomHotelsCard extends StatelessWidget {
  const CustomHotelsCard({super.key, required this.hotel});

  final Hotels hotel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => HotelDetailsScreen(
        //       hotel:hotel
        //     ),
        //   ),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: hotel.image ??
                    'https://demofree.sirv.com/nope-not-here.jpg',
                errorWidget: (context, url, s) {
                  return Container(color: Colors.red);
                },
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${hotel.name}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 62, 62, 62),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${hotel.roomPrice}\$',
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                    maxLines: 4,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
