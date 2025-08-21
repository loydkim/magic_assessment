import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/workout.dart';
part 'workout_list_state.freezed.dart';

@freezed
abstract class WorkoutListState with _$WorkoutListState {
  const factory WorkoutListState({
    @Default(false) bool loading,
    @Default(<Workout>[]) List<Workout> items,
    String? error,
  }) = _WorkoutListState;
}
