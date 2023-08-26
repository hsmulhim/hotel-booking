import 'dart:developer';

import 'package:hotel_booking/models/hotels_model.dart';
import 'package:hotel_booking/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<Hotels>> getHotels() async {
  final hotels = await Supabase.instance.client.from('hotels').select();
  // log(hotels.toString());
  hotelsModel.clear();
  for (var element in hotels) {
    hotelsModel.add(Hotels.fromJson(element));
  }
  return hotelsModel;
}
