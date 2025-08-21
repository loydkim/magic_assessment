// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Workout _$WorkoutFromJson(Map<String, dynamic> json) => _Workout(
  id: (json['id'] as num?)?.toInt(),
  date: DateTime.parse(json['date'] as String),
  notes: json['notes'] as String?,
  sets: (json['sets'] as List<dynamic>)
      .map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkoutToJson(_Workout instance) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'notes': instance.notes,
  'sets': instance.sets,
};
