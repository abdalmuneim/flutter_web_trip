import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local_trip_data_source.dart';
import '../../data/repositories/trip_repository_impl.dart';
import '../../domain/entities/trip.dart';
import '../../domain/usecases/get_trips_usecase.dart';

final tripProvider = StateNotifierProvider<TripNotifier, AsyncValue<List<Trip>>>((ref) {
  final useCase = ref.watch(getTripsUseCaseProvider);
  return TripNotifier(useCase);
});

final getTripsUseCaseProvider = Provider((ref) {
  final repository = ref.watch(tripRepositoryProvider);
  return GetTripsUseCase(repository);
});

final tripRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(tripDataSourceProvider);
  return TripRepositoryImpl(dataSource);
});

final tripDataSourceProvider = Provider((ref) => LocalTripDataSource());

class TripNotifier extends StateNotifier<AsyncValue<List<Trip>>> {
  final GetTripsUseCase _getTripsUseCase;

  TripNotifier(this._getTripsUseCase) : super(const AsyncValue.loading()) {
    loadTrips();
  }

  Future<void> loadTrips() async {
    state = const AsyncValue.loading();
    final result = await _getTripsUseCase.execute();
    state = result.fold(
      (error) => AsyncValue.error(error, StackTrace.current),
      (trips) => AsyncValue.data(trips),
    );
  }
}
