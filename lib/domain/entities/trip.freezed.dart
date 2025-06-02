// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TripParticipant _$TripParticipantFromJson(Map<String, dynamic> json) {
  return _TripParticipant.fromJson(json);
}

/// @nodoc
mixin _$TripParticipant {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this TripParticipant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TripParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripParticipantCopyWith<TripParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripParticipantCopyWith<$Res> {
  factory $TripParticipantCopyWith(
    TripParticipant value,
    $Res Function(TripParticipant) then,
  ) = _$TripParticipantCopyWithImpl<$Res, TripParticipant>;
  @useResult
  $Res call({String? name, @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class _$TripParticipantCopyWithImpl<$Res, $Val extends TripParticipant>
    implements $TripParticipantCopyWith<$Res> {
  _$TripParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? avatarUrl = freezed}) {
    return _then(
      _value.copyWith(
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            avatarUrl:
                freezed == avatarUrl
                    ? _value.avatarUrl
                    : avatarUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TripParticipantImplCopyWith<$Res>
    implements $TripParticipantCopyWith<$Res> {
  factory _$$TripParticipantImplCopyWith(
    _$TripParticipantImpl value,
    $Res Function(_$TripParticipantImpl) then,
  ) = __$$TripParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class __$$TripParticipantImplCopyWithImpl<$Res>
    extends _$TripParticipantCopyWithImpl<$Res, _$TripParticipantImpl>
    implements _$$TripParticipantImplCopyWith<$Res> {
  __$$TripParticipantImplCopyWithImpl(
    _$TripParticipantImpl _value,
    $Res Function(_$TripParticipantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TripParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? avatarUrl = freezed}) {
    return _then(
      _$TripParticipantImpl(
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        avatarUrl:
            freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TripParticipantImpl implements _TripParticipant {
  const _$TripParticipantImpl({
    this.name,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
  });

  factory _$TripParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripParticipantImplFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @override
  String toString() {
    return 'TripParticipant(name: $name, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripParticipantImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, avatarUrl);

  /// Create a copy of TripParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripParticipantImplCopyWith<_$TripParticipantImpl> get copyWith =>
      __$$TripParticipantImplCopyWithImpl<_$TripParticipantImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TripParticipantImplToJson(this);
  }
}

abstract class _TripParticipant implements TripParticipant {
  const factory _TripParticipant({
    final String? name,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
  }) = _$TripParticipantImpl;

  factory _TripParticipant.fromJson(Map<String, dynamic> json) =
      _$TripParticipantImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;

  /// Create a copy of TripParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripParticipantImplCopyWith<_$TripParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TripDates _$TripDatesFromJson(Map<String, dynamic> json) {
  return _TripDates.fromJson(json);
}

/// @nodoc
mixin _$TripDates {
  String? get start => throw _privateConstructorUsedError;
  String? get end => throw _privateConstructorUsedError;

  /// Serializes this TripDates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TripDates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripDatesCopyWith<TripDates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripDatesCopyWith<$Res> {
  factory $TripDatesCopyWith(TripDates value, $Res Function(TripDates) then) =
      _$TripDatesCopyWithImpl<$Res, TripDates>;
  @useResult
  $Res call({String? start, String? end});
}

/// @nodoc
class _$TripDatesCopyWithImpl<$Res, $Val extends TripDates>
    implements $TripDatesCopyWith<$Res> {
  _$TripDatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripDates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = freezed, Object? end = freezed}) {
    return _then(
      _value.copyWith(
            start:
                freezed == start
                    ? _value.start
                    : start // ignore: cast_nullable_to_non_nullable
                        as String?,
            end:
                freezed == end
                    ? _value.end
                    : end // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TripDatesImplCopyWith<$Res>
    implements $TripDatesCopyWith<$Res> {
  factory _$$TripDatesImplCopyWith(
    _$TripDatesImpl value,
    $Res Function(_$TripDatesImpl) then,
  ) = __$$TripDatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? start, String? end});
}

/// @nodoc
class __$$TripDatesImplCopyWithImpl<$Res>
    extends _$TripDatesCopyWithImpl<$Res, _$TripDatesImpl>
    implements _$$TripDatesImplCopyWith<$Res> {
  __$$TripDatesImplCopyWithImpl(
    _$TripDatesImpl _value,
    $Res Function(_$TripDatesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TripDates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = freezed, Object? end = freezed}) {
    return _then(
      _$TripDatesImpl(
        start:
            freezed == start
                ? _value.start
                : start // ignore: cast_nullable_to_non_nullable
                    as String?,
        end:
            freezed == end
                ? _value.end
                : end // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TripDatesImpl implements _TripDates {
  const _$TripDatesImpl({this.start, this.end});

  factory _$TripDatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripDatesImplFromJson(json);

  @override
  final String? start;
  @override
  final String? end;

  @override
  String toString() {
    return 'TripDates(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripDatesImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of TripDates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripDatesImplCopyWith<_$TripDatesImpl> get copyWith =>
      __$$TripDatesImplCopyWithImpl<_$TripDatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripDatesImplToJson(this);
  }
}

abstract class _TripDates implements TripDates {
  const factory _TripDates({final String? start, final String? end}) =
      _$TripDatesImpl;

  factory _TripDates.fromJson(Map<String, dynamic> json) =
      _$TripDatesImpl.fromJson;

  @override
  String? get start;
  @override
  String? get end;

  /// Create a copy of TripDates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripDatesImplCopyWith<_$TripDatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  String? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  TripDates? get dates => throw _privateConstructorUsedError;
  List<TripParticipant>? get participants => throw _privateConstructorUsedError;
  @JsonKey(name: 'unfinished_tasks')
  int? get unfinishedTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;

  /// Serializes this Trip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call({
    String? id,
    String? status,
    String? title,
    TripDates? dates,
    List<TripParticipant>? participants,
    @JsonKey(name: 'unfinished_tasks') int? unfinishedTasks,
    @JsonKey(name: 'cover_image') String? coverImage,
  });

  $TripDatesCopyWith<$Res>? get dates;
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? title = freezed,
    Object? dates = freezed,
    Object? participants = freezed,
    Object? unfinishedTasks = freezed,
    Object? coverImage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            dates:
                freezed == dates
                    ? _value.dates
                    : dates // ignore: cast_nullable_to_non_nullable
                        as TripDates?,
            participants:
                freezed == participants
                    ? _value.participants
                    : participants // ignore: cast_nullable_to_non_nullable
                        as List<TripParticipant>?,
            unfinishedTasks:
                freezed == unfinishedTasks
                    ? _value.unfinishedTasks
                    : unfinishedTasks // ignore: cast_nullable_to_non_nullable
                        as int?,
            coverImage:
                freezed == coverImage
                    ? _value.coverImage
                    : coverImage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TripDatesCopyWith<$Res>? get dates {
    if (_value.dates == null) {
      return null;
    }

    return $TripDatesCopyWith<$Res>(_value.dates!, (value) {
      return _then(_value.copyWith(dates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
    _$TripImpl value,
    $Res Function(_$TripImpl) then,
  ) = __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? status,
    String? title,
    TripDates? dates,
    List<TripParticipant>? participants,
    @JsonKey(name: 'unfinished_tasks') int? unfinishedTasks,
    @JsonKey(name: 'cover_image') String? coverImage,
  });

  @override
  $TripDatesCopyWith<$Res>? get dates;
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
    : super(_value, _then);

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? title = freezed,
    Object? dates = freezed,
    Object? participants = freezed,
    Object? unfinishedTasks = freezed,
    Object? coverImage = freezed,
  }) {
    return _then(
      _$TripImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        dates:
            freezed == dates
                ? _value.dates
                : dates // ignore: cast_nullable_to_non_nullable
                    as TripDates?,
        participants:
            freezed == participants
                ? _value._participants
                : participants // ignore: cast_nullable_to_non_nullable
                    as List<TripParticipant>?,
        unfinishedTasks:
            freezed == unfinishedTasks
                ? _value.unfinishedTasks
                : unfinishedTasks // ignore: cast_nullable_to_non_nullable
                    as int?,
        coverImage:
            freezed == coverImage
                ? _value.coverImage
                : coverImage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TripImpl implements _Trip {
  const _$TripImpl({
    this.id,
    this.status,
    this.title,
    this.dates,
    final List<TripParticipant>? participants,
    @JsonKey(name: 'unfinished_tasks') this.unfinishedTasks,
    @JsonKey(name: 'cover_image') this.coverImage,
  }) : _participants = participants;

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  final String? title;
  @override
  final TripDates? dates;
  final List<TripParticipant>? _participants;
  @override
  List<TripParticipant>? get participants {
    final value = _participants;
    if (value == null) return null;
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'unfinished_tasks')
  final int? unfinishedTasks;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;

  @override
  String toString() {
    return 'Trip(id: $id, status: $status, title: $title, dates: $dates, participants: $participants, unfinishedTasks: $unfinishedTasks, coverImage: $coverImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dates, dates) || other.dates == dates) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ) &&
            (identical(other.unfinishedTasks, unfinishedTasks) ||
                other.unfinishedTasks == unfinishedTasks) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    status,
    title,
    dates,
    const DeepCollectionEquality().hash(_participants),
    unfinishedTasks,
    coverImage,
  );

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(this);
  }
}

abstract class _Trip implements Trip {
  const factory _Trip({
    final String? id,
    final String? status,
    final String? title,
    final TripDates? dates,
    final List<TripParticipant>? participants,
    @JsonKey(name: 'unfinished_tasks') final int? unfinishedTasks,
    @JsonKey(name: 'cover_image') final String? coverImage,
  }) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  String? get id;
  @override
  String? get status;
  @override
  String? get title;
  @override
  TripDates? get dates;
  @override
  List<TripParticipant>? get participants;
  @override
  @JsonKey(name: 'unfinished_tasks')
  int? get unfinishedTasks;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
