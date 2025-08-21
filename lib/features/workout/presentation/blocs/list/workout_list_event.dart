import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart'
    as domain;

part 'workout_list_event.freezed.dart';

@freezed
class WorkoutListEvent with _$WorkoutListEvent {
  const factory WorkoutListEvent.started() = _Started;
  const factory WorkoutListEvent.deleted(int id) = _Deleted;

  // 내부 스트림 동기화 이벤트
  const factory WorkoutListEvent.synced(List<domain.Workout> items) = _Synced;
}
