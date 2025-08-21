import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/workout.dart';

part 'workout_editor_state.freezed.dart';

@freezed
abstract class WorkoutEditorState with _$WorkoutEditorState {
  const factory WorkoutEditorState({
    @Default(false) bool loading,
    @Default(false) bool saving,
    @Default(false) bool saveSuccess,
    String? error,
    Workout? workout,
    @Default(false) bool isNew,
  }) = _WorkoutEditorState;
}
