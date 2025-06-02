import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/entities/trip.dart';

class LocalTripDataSource {
  Future<List<Trip>> getTrips() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/trips_mock.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final List<dynamic> tripsList = jsonMap['trips'];
      
      return tripsList.map((json) => Trip.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load trips: $e');
    }
  }
}
