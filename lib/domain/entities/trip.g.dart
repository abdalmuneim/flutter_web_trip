// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripParticipantImpl _$$TripParticipantImplFromJson(
  Map<String, dynamic> json,
) => _$TripParticipantImpl(
  name: json['name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$$TripParticipantImplToJson(
  _$TripParticipantImpl instance,
) => <String, dynamic>{'name': instance.name, 'avatar_url': instance.avatarUrl};

_$TripDatesImpl _$$TripDatesImplFromJson(Map<String, dynamic> json) =>
    _$TripDatesImpl(
      start: json['start'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$$TripDatesImplToJson(_$TripDatesImpl instance) =>
    <String, dynamic>{'start': instance.start, 'end': instance.end};

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
  id: json['id'] as String?,
  status: json['status'] as String?,
  title: json['title'] as String?,
  dates:
      json['dates'] == null
          ? null
          : TripDates.fromJson(json['dates'] as Map<String, dynamic>),
  participants:
      (json['participants'] as List<dynamic>?)
          ?.map((e) => TripParticipant.fromJson(e as Map<String, dynamic>))
          .toList(),
  unfinishedTasks: (json['unfinished_tasks'] as num?)?.toInt(),
  coverImage: json['cover_image'] as String?,
);

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'title': instance.title,
      'dates': instance.dates,
      'participants': instance.participants,
      'unfinished_tasks': instance.unfinishedTasks,
      'cover_image': instance.coverImage,
    };
