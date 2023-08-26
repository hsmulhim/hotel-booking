import 'package:flutter/material.dart';
import 'package:hotel_booking/screens/explor_screen.dart';
import 'package:hotel_booking/screens/home_screen.dart';
import 'package:hotel_booking/screens/log_in_screen.dart';
import 'package:hotel_booking/screens/view_screen.dart';
import 'package:hotel_booking/services/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://pzyqylzekpzcshxojagc.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB6eXF5bHpla3B6Y3NoeG9qYWdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4NjMxMzUsImV4cCI6MjAwODQzOTEzNX0.Qde84ds0HB9zSyJE4AdYDnFb1_L3PDtFAQBWx2HJuZQ');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    getHotels();
    return const MaterialApp(
      home: LogInScreen(),
    );
  }
}
