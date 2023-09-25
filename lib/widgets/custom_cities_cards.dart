import 'package:flutter/material.dart';

class Cities extends StatelessWidget {
  const Cities({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> cities = {
      "assets/images/1.png": " Paris", // add unique images
      "assets/images/10.png": "London",
      "assets/images/1.png": "Bangkok",
      "assets/images/1.png": "Roma",
      "assets/images/1.png": "Jakarta"
    };
    return Row(
        children: cities.entries.map((e) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 205, 231, 250),
              ),
              child: Image.asset(
                e.key,
                height: 50,
                width: 55,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              e.value,
              style: const TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
      );
    }).toList());
  }
}
