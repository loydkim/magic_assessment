// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutEditorState {

 bool get loading; bool get saving; bool get saveSuccess; String? get error; Workout? get workout; bool get isNew;
/// Create a copy of WorkoutEditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutEditorStateCopyWith<WorkoutEditorState> get copyWith => _$WorkoutEditorStateCopyWithImpl<WorkoutEditorState>(this as WorkoutEditorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutEditorState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.saving, saving) || other.saving == saving)&&(identical(other.saveSuccess, saveSuccess) || other.saveSuccess == saveSuccess)&&(identical(other.error, error) || other.error == error)&&(identical(other.workout, workout) || other.workout == workout)&&(identical(other.isNew, isNew) || other.isNew == isNew));
}


@override
int get hashCode => Object.hash(runtimeType,loading,saving,saveSuccess,error,workout,isNew);

@override
String toString() {
  return 'WorkoutEditorState(loading: $loading, saving: $saving, saveSuccess: $saveSuccess, error: $error, workout: $workout, isNew: $isNew)';
}


}

/// @nodoc
abstract mixin class $WorkoutEditorStateCopyWith<$Res>  {
  factory $WorkoutEditorStateCopyWith(WorkoutEditorState value, $Res Function(WorkoutEditorState) _then) = _$WorkoutEditorStateCopyWithImpl;
@useResult
$Res call({
 bool loading, bool saving, bool saveSuccess, String? error, Workout? workout, bool isNew
});


$WorkoutCopyWith<$Res>? get workout;

}
/// @nodoc
class _$WorkoutEditorStateCopyWithImpl<$Res>
    implements $WorkoutEditorStateCopyWith<$Res> {
  _$WorkoutEditorStateCopyWithImpl(this._self, this._then);

  final WorkoutEditorState _self;
  final $Res Function(WorkoutEditorState) _then;

/// Create a copy of WorkoutEditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? saving = null,Object? saveSuccess = null,Object? error = freezed,Object? workout = freezed,Object? isNew = null,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,saveSuccess: null == saveSuccess ? _self.saveSuccess : saveSuccess // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,workout: freezed == workout ? _self.workout : workout // ignore: cast_nullable_to_non_nullable
as Workout?,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WorkoutEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutCopyWith<$Res>? get workout {
    if (_self.workout == null) {
    return null;
  }

  return $WorkoutCopyWith<$Res>(_self.workout!, (value) {
    return _then(_self.copyWith(workout: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkoutEditorState].
extension WorkoutEditorStatePatterns on WorkoutEditorState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutEditorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutEditorState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutEditorState value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutEditorState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutEditorState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutEditorState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  bool saving,  bool saveSuccess,  String? error,  Workout? workout,  bool isNew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutEditorState() when $default != null:
return $default(_that.loading,_that.saving,_that.saveSuccess,_that.error,_that.workout,_that.isNew);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  bool saving,  bool saveSuccess,  String? error,  Workout? workout,  bool isNew)  $default,) {final _that = this;
switch (_that) {
case _WorkoutEditorState():
return $default(_that.loading,_that.saving,_that.saveSuccess,_that.error,_that.workout,_that.isNew);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  bool saving,  bool saveSuccess,  String? error,  Workout? workout,  bool isNew)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutEditorState() when $default != null:
return $default(_that.loading,_that.saving,_that.saveSuccess,_that.error,_that.workout,_that.isNew);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutEditorState implements WorkoutEditorState {
  const _WorkoutEditorState({this.loading = false, this.saving = false, this.saveSuccess = false, this.error, this.workout, this.isNew = false});
  

@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool saving;
@override@JsonKey() final  bool saveSuccess;
@override final  String? error;
@override final  Workout? workout;
@override@JsonKey() final  bool isNew;

/// Create a copy of WorkoutEditorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutEditorStateCopyWith<_WorkoutEditorState> get copyWith => __$WorkoutEditorStateCopyWithImpl<_WorkoutEditorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutEditorState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.saving, saving) || other.saving == saving)&&(identical(other.saveSuccess, saveSuccess) || other.saveSuccess == saveSuccess)&&(identical(other.error, error) || other.error == error)&&(identical(other.workout, workout) || other.workout == workout)&&(identical(other.isNew, isNew) || other.isNew == isNew));
}


@override
int get hashCode => Object.hash(runtimeType,loading,saving,saveSuccess,error,workout,isNew);

@override
String toString() {
  return 'WorkoutEditorState(loading: $loading, saving: $saving, saveSuccess: $saveSuccess, error: $error, workout: $workout, isNew: $isNew)';
}


}

/// @nodoc
abstract mixin class _$WorkoutEditorStateCopyWith<$Res> implements $WorkoutEditorStateCopyWith<$Res> {
  factory _$WorkoutEditorStateCopyWith(_WorkoutEditorState value, $Res Function(_WorkoutEditorState) _then) = __$WorkoutEditorStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, bool saving, bool saveSuccess, String? error, Workout? workout, bool isNew
});


@override $WorkoutCopyWith<$Res>? get workout;

}
/// @nodoc
class __$WorkoutEditorStateCopyWithImpl<$Res>
    implements _$WorkoutEditorStateCopyWith<$Res> {
  __$WorkoutEditorStateCopyWithImpl(this._self, this._then);

  final _WorkoutEditorState _self;
  final $Res Function(_WorkoutEditorState) _then;

/// Create a copy of WorkoutEditorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? saving = null,Object? saveSuccess = null,Object? error = freezed,Object? workout = freezed,Object? isNew = null,}) {
  return _then(_WorkoutEditorState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,saveSuccess: null == saveSuccess ? _self.saveSuccess : saveSuccess // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,workout: freezed == workout ? _self.workout : workout // ignore: cast_nullable_to_non_nullable
as Workout?,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WorkoutEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutCopyWith<$Res>? get workout {
    if (_self.workout == null) {
    return null;
  }

  return $WorkoutCopyWith<$Res>(_self.workout!, (value) {
    return _then(_self.copyWith(workout: value));
  });
}
}

// dart format on
