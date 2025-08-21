import 'package:freezed_annotation/freezed_annotation.dart';
import 'workout_set.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
abstract class Workout with _$Workout {
  const factory Workout({
    int? id,
    required DateTime date,
    String? notes,
    required List<WorkoutSet> sets,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}
