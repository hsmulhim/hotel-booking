import 'package:flutter/material.dart';

import 'package:hotel_booking/widgets/custom_cities_cards.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: 245,
              color: Colors.blue,
            ),
            const Positioned(
              top: 90,
              left: 30,
              child: Text('Hello',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Positioned(
                top: 8, left: 180, child: Image.asset('assets/images/10.png')),
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
                            hintText: 'What do you want to stay ',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(),
                            )))))
          ],
        ),
        const Row(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Poplular Cities ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ],
        ),
        const Cities(),
        Text("data")
      ]),
    );
  }
}
