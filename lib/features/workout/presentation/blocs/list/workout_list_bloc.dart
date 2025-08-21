import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart'
    as domain;
import 'package:magic_ai_assessment/features/workout/domain/usecases/delete_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/watch_workouts.dart';
import 'workout_list_event.dart';
import 'workout_list_state.dart';

class WorkoutListBloc extends Bloc<WorkoutListEvent, WorkoutListState> {
  WorkoutListBloc({required WatchWorkouts watch, required DeleteWorkout delete})
    : _watch = watch,
      _delete = delete,
      super(const WorkoutListState(loading: true)) {
    on<WorkoutListEvent>(_onEvent);
  }

  final WatchWorkouts _watch;
  final DeleteWorkout _delete;
  StreamSubscription<List<domain.Workout>>? _sub;

  Future<void> _onEvent(
    WorkoutListEvent event,
    Emitter<WorkoutListState> emit,
  ) async {
    await event.map(
      started: (_) async {
        emit(state.copyWith(loading: true, error: null));
        await _sub?.cancel();
        _sub = _watch().listen(
          (items) => add(WorkoutListEvent.synced(items)),
          onError: (e) =>
              emit(state.copyWith(loading: false, error: e.toString())),
        );
      },
      deleted: (e) async {
        await _delete(e.id);
      },
      synced: (e) async {
        emit(state.copyWith(loading: false, items: e.items, error: null));
      },
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
