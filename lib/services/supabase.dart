import 'dart:developer';

import 'package:hotel_booking/models/bookings_model.dart';
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

Future<List<Bookings>> getBookings() async {
  print(Supabase.instance.client.auth.currentSession!.user.id);
  final bookings = await Supabase.instance.client
      .from('bookings')
      .select()
      .eq("user_id", Supabase.instance.client.auth.currentSession!.user.id);
  log(bookings.toString());
  bookingsModel.clear();
  for (var element in bookings) {
    bookingsModel.add(Bookings.fromJson(element));
  }
  return bookingsModel;
}

Future insertBooking(Map book) async {
  print(book);
  final supabase = Supabase.instance.client;
  await supabase.from('bookings').insert(book);
}

Future deleteCourse(String bookingId) async {
  final supabase = Supabase.instance.client;
  await supabase.from('bookings').delete().eq('id', bookingId);
}
