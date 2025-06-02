import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

@freezed
class TripParticipant with _$TripParticipant {
  const factory TripParticipant({
    String? name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _TripParticipant;

  factory TripParticipant.fromJson(Map<String, dynamic> json) =>
      _$TripParticipantFromJson(json);
}

@freezed
class TripDates with _$TripDates {
  const factory TripDates({String? start, String? end}) = _TripDates;

  factory TripDates.fromJson(Map<String, dynamic> json) =>
      _$TripDatesFromJson(json);
}

@freezed
class Trip with _$Trip {
  const factory Trip({
    String? id,
    String? status,
    String? title,
    TripDates? dates,
    List<TripParticipant>? participants,
    @JsonKey(name: 'unfinished_tasks') int? unfinishedTasks,
    @JsonKey(name: 'cover_image') String? coverImage,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
