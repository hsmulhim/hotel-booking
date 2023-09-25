import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(340, 50),
  primary: Colors.blue,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);
