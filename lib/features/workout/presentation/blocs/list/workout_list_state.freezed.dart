// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutListState {

 bool get loading; List<Workout> get items; String? get error;
/// Create a copy of WorkoutListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutListStateCopyWith<WorkoutListState> get copyWith => _$WorkoutListStateCopyWithImpl<WorkoutListState>(this as WorkoutListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutListState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(items),error);

@override
String toString() {
  return 'WorkoutListState(loading: $loading, items: $items, error: $error)';
}


}

/// @nodoc
abstract mixin class $WorkoutListStateCopyWith<$Res>  {
  factory $WorkoutListStateCopyWith(WorkoutListState value, $Res Function(WorkoutListState) _then) = _$WorkoutListStateCopyWithImpl;
@useResult
$Res call({
 bool loading, List<Workout> items, String? error
});




}
/// @nodoc
class _$WorkoutListStateCopyWithImpl<$Res>
    implements $WorkoutListStateCopyWith<$Res> {
  _$WorkoutListStateCopyWithImpl(this._self, this._then);

  final WorkoutListState _self;
  final $Res Function(WorkoutListState) _then;

/// Create a copy of WorkoutListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? items = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Workout>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutListState].
extension WorkoutListStatePatterns on WorkoutListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutListState value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutListState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  List<Workout> items,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutListState() when $default != null:
return $default(_that.loading,_that.items,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  List<Workout> items,  String? error)  $default,) {final _that = this;
switch (_that) {
case _WorkoutListState():
return $default(_that.loading,_that.items,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  List<Workout> items,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutListState() when $default != null:
return $default(_that.loading,_that.items,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutListState implements WorkoutListState {
  const _WorkoutListState({this.loading = false, final  List<Workout> items = const <Workout>[], this.error}): _items = items;
  

@override@JsonKey() final  bool loading;
 final  List<Workout> _items;
@override@JsonKey() List<Workout> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? error;

/// Create a copy of WorkoutListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutListStateCopyWith<_WorkoutListState> get copyWith => __$WorkoutListStateCopyWithImpl<_WorkoutListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutListState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(_items),error);

@override
String toString() {
  return 'WorkoutListState(loading: $loading, items: $items, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WorkoutListStateCopyWith<$Res> implements $WorkoutListStateCopyWith<$Res> {
  factory _$WorkoutListStateCopyWith(_WorkoutListState value, $Res Function(_WorkoutListState) _then) = __$WorkoutListStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, List<Workout> items, String? error
});




}
/// @nodoc
class __$WorkoutListStateCopyWithImpl<$Res>
    implements _$WorkoutListStateCopyWith<$Res> {
  __$WorkoutListStateCopyWithImpl(this._self, this._then);

  final _WorkoutListState _self;
  final $Res Function(_WorkoutListState) _then;

/// Create a copy of WorkoutListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? items = null,Object? error = freezed,}) {
  return _then(_WorkoutListState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Workout>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
