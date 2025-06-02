import 'package:dartz/dartz.dart';
import '../entities/trip.dart';

abstract class TripRepository {
  Future<Either<String, List<Trip>>> getTrips();
}
