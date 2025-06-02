import 'package:dartz/dartz.dart';
import '../../domain/entities/trip.dart';
import '../../domain/repositories/trip_repository.dart';
import '../datasources/local_trip_data_source.dart';

class TripRepositoryImpl implements TripRepository {
  final LocalTripDataSource dataSource;

  TripRepositoryImpl(this.dataSource);

  @override
  Future<Either<String, List<Trip>>> getTrips() async {
    try {
      final trips = await dataSource.getTrips();
      return Right(trips);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
