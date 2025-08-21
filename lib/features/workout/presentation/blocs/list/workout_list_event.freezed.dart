// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutListEvent()';
}


}

/// @nodoc
class $WorkoutListEventCopyWith<$Res>  {
$WorkoutListEventCopyWith(WorkoutListEvent _, $Res Function(WorkoutListEvent) __);
}


/// Adds pattern-matching-related methods to [WorkoutListEvent].
extension WorkoutListEventPatterns on WorkoutListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Deleted value)?  deleted,TResult Function( _Synced value)?  synced,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Synced() when synced != null:
return synced(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Deleted value)  deleted,required TResult Function( _Synced value)  synced,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Deleted():
return deleted(_that);case _Synced():
return synced(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Synced value)?  synced,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Synced() when synced != null:
return synced(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int id)?  deleted,TResult Function( List<domain.Workout> items)?  synced,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Deleted() when deleted != null:
return deleted(_that.id);case _Synced() when synced != null:
return synced(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int id)  deleted,required TResult Function( List<domain.Workout> items)  synced,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Deleted():
return deleted(_that.id);case _Synced():
return synced(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int id)?  deleted,TResult? Function( List<domain.Workout> items)?  synced,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Deleted() when deleted != null:
return deleted(_that.id);case _Synced() when synced != null:
return synced(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements WorkoutListEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutListEvent.started()';
}


}




/// @nodoc


class _Deleted implements WorkoutListEvent {
  const _Deleted(this.id);
  

 final  int id;

/// Create a copy of WorkoutListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'WorkoutListEvent.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $WorkoutListEventCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of WorkoutListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Deleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Synced implements WorkoutListEvent {
  const _Synced(final  List<domain.Workout> items): _items = items;
  

 final  List<domain.Workout> _items;
 List<domain.Workout> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of WorkoutListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncedCopyWith<_Synced> get copyWith => __$SyncedCopyWithImpl<_Synced>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Synced&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'WorkoutListEvent.synced(items: $items)';
}


}

/// @nodoc
abstract mixin class _$SyncedCopyWith<$Res> implements $WorkoutListEventCopyWith<$Res> {
  factory _$SyncedCopyWith(_Synced value, $Res Function(_Synced) _then) = __$SyncedCopyWithImpl;
@useResult
$Res call({
 List<domain.Workout> items
});




}
/// @nodoc
class __$SyncedCopyWithImpl<$Res>
    implements _$SyncedCopyWith<$Res> {
  __$SyncedCopyWithImpl(this._self, this._then);

  final _Synced _self;
  final $Res Function(_Synced) _then;

/// Create a copy of WorkoutListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_Synced(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<domain.Workout>,
  ));
}


}

// dart format on
