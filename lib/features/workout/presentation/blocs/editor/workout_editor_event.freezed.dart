// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_editor_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutEditorEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutEditorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutEditorEvent()';
}


}

/// @nodoc
class $WorkoutEditorEventCopyWith<$Res>  {
$WorkoutEditorEventCopyWith(WorkoutEditorEvent _, $Res Function(WorkoutEditorEvent) __);
}


/// Adds pattern-matching-related methods to [WorkoutEditorEvent].
extension WorkoutEditorEventPatterns on WorkoutEditorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateNew value)?  createNew,TResult Function( _EditExisting value)?  editExisting,TResult Function( _DateChanged value)?  dateChanged,TResult Function( _NotesChanged value)?  notesChanged,TResult Function( _AddSet value)?  addSet,TResult Function( _UpdateSet value)?  updateSet,TResult Function( _RemoveSet value)?  removeSet,TResult Function( _Save value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateNew() when createNew != null:
return createNew(_that);case _EditExisting() when editExisting != null:
return editExisting(_that);case _DateChanged() when dateChanged != null:
return dateChanged(_that);case _NotesChanged() when notesChanged != null:
return notesChanged(_that);case _AddSet() when addSet != null:
return addSet(_that);case _UpdateSet() when updateSet != null:
return updateSet(_that);case _RemoveSet() when removeSet != null:
return removeSet(_that);case _Save() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateNew value)  createNew,required TResult Function( _EditExisting value)  editExisting,required TResult Function( _DateChanged value)  dateChanged,required TResult Function( _NotesChanged value)  notesChanged,required TResult Function( _AddSet value)  addSet,required TResult Function( _UpdateSet value)  updateSet,required TResult Function( _RemoveSet value)  removeSet,required TResult Function( _Save value)  save,}){
final _that = this;
switch (_that) {
case _CreateNew():
return createNew(_that);case _EditExisting():
return editExisting(_that);case _DateChanged():
return dateChanged(_that);case _NotesChanged():
return notesChanged(_that);case _AddSet():
return addSet(_that);case _UpdateSet():
return updateSet(_that);case _RemoveSet():
return removeSet(_that);case _Save():
return save(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateNew value)?  createNew,TResult? Function( _EditExisting value)?  editExisting,TResult? Function( _DateChanged value)?  dateChanged,TResult? Function( _NotesChanged value)?  notesChanged,TResult? Function( _AddSet value)?  addSet,TResult? Function( _UpdateSet value)?  updateSet,TResult? Function( _RemoveSet value)?  removeSet,TResult? Function( _Save value)?  save,}){
final _that = this;
switch (_that) {
case _CreateNew() when createNew != null:
return createNew(_that);case _EditExisting() when editExisting != null:
return editExisting(_that);case _DateChanged() when dateChanged != null:
return dateChanged(_that);case _NotesChanged() when notesChanged != null:
return notesChanged(_that);case _AddSet() when addSet != null:
return addSet(_that);case _UpdateSet() when updateSet != null:
return updateSet(_that);case _RemoveSet() when removeSet != null:
return removeSet(_that);case _Save() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  createNew,TResult Function( int id)?  editExisting,TResult Function( DateTime date)?  dateChanged,TResult Function( String? notes)?  notesChanged,TResult Function()?  addSet,TResult Function( int index,  WorkoutSet set)?  updateSet,TResult Function( int index)?  removeSet,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateNew() when createNew != null:
return createNew();case _EditExisting() when editExisting != null:
return editExisting(_that.id);case _DateChanged() when dateChanged != null:
return dateChanged(_that.date);case _NotesChanged() when notesChanged != null:
return notesChanged(_that.notes);case _AddSet() when addSet != null:
return addSet();case _UpdateSet() when updateSet != null:
return updateSet(_that.index,_that.set);case _RemoveSet() when removeSet != null:
return removeSet(_that.index);case _Save() when save != null:
return save();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  createNew,required TResult Function( int id)  editExisting,required TResult Function( DateTime date)  dateChanged,required TResult Function( String? notes)  notesChanged,required TResult Function()  addSet,required TResult Function( int index,  WorkoutSet set)  updateSet,required TResult Function( int index)  removeSet,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case _CreateNew():
return createNew();case _EditExisting():
return editExisting(_that.id);case _DateChanged():
return dateChanged(_that.date);case _NotesChanged():
return notesChanged(_that.notes);case _AddSet():
return addSet();case _UpdateSet():
return updateSet(_that.index,_that.set);case _RemoveSet():
return removeSet(_that.index);case _Save():
return save();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  createNew,TResult? Function( int id)?  editExisting,TResult? Function( DateTime date)?  dateChanged,TResult? Function( String? notes)?  notesChanged,TResult? Function()?  addSet,TResult? Function( int index,  WorkoutSet set)?  updateSet,TResult? Function( int index)?  removeSet,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case _CreateNew() when createNew != null:
return createNew();case _EditExisting() when editExisting != null:
return editExisting(_that.id);case _DateChanged() when dateChanged != null:
return dateChanged(_that.date);case _NotesChanged() when notesChanged != null:
return notesChanged(_that.notes);case _AddSet() when addSet != null:
return addSet();case _UpdateSet() when updateSet != null:
return updateSet(_that.index,_that.set);case _RemoveSet() when removeSet != null:
return removeSet(_that.index);case _Save() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class _CreateNew implements WorkoutEditorEvent {
  const _CreateNew();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNew);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutEditorEvent.createNew()';
}


}




/// @nodoc


class _EditExisting implements WorkoutEditorEvent {
  const _EditExisting(this.id);
  

 final  int id;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditExistingCopyWith<_EditExisting> get copyWith => __$EditExistingCopyWithImpl<_EditExisting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditExisting&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'WorkoutEditorEvent.editExisting(id: $id)';
}


}

/// @nodoc
abstract mixin class _$EditExistingCopyWith<$Res> implements $WorkoutEditorEventCopyWith<$Res> {
  factory _$EditExistingCopyWith(_EditExisting value, $Res Function(_EditExisting) _then) = __$EditExistingCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$EditExistingCopyWithImpl<$Res>
    implements _$EditExistingCopyWith<$Res> {
  __$EditExistingCopyWithImpl(this._self, this._then);

  final _EditExisting _self;
  final $Res Function(_EditExisting) _then;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_EditExisting(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DateChanged implements WorkoutEditorEvent {
  const _DateChanged(this.date);
  

 final  DateTime date;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateChangedCopyWith<_DateChanged> get copyWith => __$DateChangedCopyWithImpl<_DateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateChanged&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'WorkoutEditorEvent.dateChanged(date: $date)';
}


}

/// @nodoc
abstract mixin class _$DateChangedCopyWith<$Res> implements $WorkoutEditorEventCopyWith<$Res> {
  factory _$DateChangedCopyWith(_DateChanged value, $Res Function(_DateChanged) _then) = __$DateChangedCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class __$DateChangedCopyWithImpl<$Res>
    implements _$DateChangedCopyWith<$Res> {
  __$DateChangedCopyWithImpl(this._self, this._then);

  final _DateChanged _self;
  final $Res Function(_DateChanged) _then;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(_DateChanged(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _NotesChanged implements WorkoutEditorEvent {
  const _NotesChanged(this.notes);
  

 final  String? notes;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotesChangedCopyWith<_NotesChanged> get copyWith => __$NotesChangedCopyWithImpl<_NotesChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotesChanged&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,notes);

@override
String toString() {
  return 'WorkoutEditorEvent.notesChanged(notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$NotesChangedCopyWith<$Res> implements $WorkoutEditorEventCopyWith<$Res> {
  factory _$NotesChangedCopyWith(_NotesChanged value, $Res Function(_NotesChanged) _then) = __$NotesChangedCopyWithImpl;
@useResult
$Res call({
 String? notes
});




}
/// @nodoc
class __$NotesChangedCopyWithImpl<$Res>
    implements _$NotesChangedCopyWith<$Res> {
  __$NotesChangedCopyWithImpl(this._self, this._then);

  final _NotesChanged _self;
  final $Res Function(_NotesChanged) _then;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notes = freezed,}) {
  return _then(_NotesChanged(
freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _AddSet implements WorkoutEditorEvent {
  const _AddSet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddSet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutEditorEvent.addSet()';
}


}




/// @nodoc


class _UpdateSet implements WorkoutEditorEvent {
  const _UpdateSet(this.index, this.set);
  

 final  int index;
 final  WorkoutSet set;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSetCopyWith<_UpdateSet> get copyWith => __$UpdateSetCopyWithImpl<_UpdateSet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSet&&(identical(other.index, index) || other.index == index)&&(identical(other.set, set) || other.set == set));
}


@override
int get hashCode => Object.hash(runtimeType,index,set);

@override
String toString() {
  return 'WorkoutEditorEvent.updateSet(index: $index, set: $set)';
}


}

/// @nodoc
abstract mixin class _$UpdateSetCopyWith<$Res> implements $WorkoutEditorEventCopyWith<$Res> {
  factory _$UpdateSetCopyWith(_UpdateSet value, $Res Function(_UpdateSet) _then) = __$UpdateSetCopyWithImpl;
@useResult
$Res call({
 int index, WorkoutSet set
});


$WorkoutSetCopyWith<$Res> get set;

}
/// @nodoc
class __$UpdateSetCopyWithImpl<$Res>
    implements _$UpdateSetCopyWith<$Res> {
  __$UpdateSetCopyWithImpl(this._self, this._then);

  final _UpdateSet _self;
  final $Res Function(_UpdateSet) _then;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? set = null,}) {
  return _then(_UpdateSet(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,null == set ? _self.set : set // ignore: cast_nullable_to_non_nullable
as WorkoutSet,
  ));
}

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutSetCopyWith<$Res> get set {
  
  return $WorkoutSetCopyWith<$Res>(_self.set, (value) {
    return _then(_self.copyWith(set: value));
  });
}
}

/// @nodoc


class _RemoveSet implements WorkoutEditorEvent {
  const _RemoveSet(this.index);
  

 final  int index;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveSetCopyWith<_RemoveSet> get copyWith => __$RemoveSetCopyWithImpl<_RemoveSet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveSet&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'WorkoutEditorEvent.removeSet(index: $index)';
}


}

/// @nodoc
abstract mixin class _$RemoveSetCopyWith<$Res> implements $WorkoutEditorEventCopyWith<$Res> {
  factory _$RemoveSetCopyWith(_RemoveSet value, $Res Function(_RemoveSet) _then) = __$RemoveSetCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$RemoveSetCopyWithImpl<$Res>
    implements _$RemoveSetCopyWith<$Res> {
  __$RemoveSetCopyWithImpl(this._self, this._then);

  final _RemoveSet _self;
  final $Res Function(_RemoveSet) _then;

/// Create a copy of WorkoutEditorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_RemoveSet(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Save implements WorkoutEditorEvent {
  const _Save();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutEditorEvent.save()';
}


}




// dart format on
