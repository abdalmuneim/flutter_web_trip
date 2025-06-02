import 'package:dartz/dartz.dart';
import '../entities/trip.dart';
import '../repositories/trip_repository.dart';

class GetTripsUseCase {
  final TripRepository repository;

  GetTripsUseCase(this.repository);

  Future<Either<String, List<Trip>>> execute() async {
    return await repository.getTrips();
  }
}
