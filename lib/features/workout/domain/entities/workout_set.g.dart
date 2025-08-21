// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) => _WorkoutSet(
  id: (json['id'] as num?)?.toInt(),
  exercise: json['exercise'] as String,
  weight: (json['weight'] as num).toDouble(),
  reps: (json['reps'] as num).toInt(),
  order: (json['order'] as num).toInt(),
);

Map<String, dynamic> _$WorkoutSetToJson(_WorkoutSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercise': instance.exercise,
      'weight': instance.weight,
      'reps': instance.reps,
      'order': instance.order,
    };
