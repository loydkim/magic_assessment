import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/workout.dart';
import '../../../domain/entities/workout_set.dart';
import '../../../domain/repositories/workout_repository.dart';
import '../../../domain/usecases/add_workout.dart';
import '../../../domain/usecases/update_workout.dart';
import 'workout_editor_event.dart';
import 'workout_editor_state.dart';

class WorkoutEditorBloc extends Bloc<WorkoutEditorEvent, WorkoutEditorState> {
  WorkoutEditorBloc({
    required AddWorkout add,
    required UpdateWorkout update,
    required WorkoutRepository repo,
  }) : _add = add,
       _update = update,
       _repo = repo,
       super(const WorkoutEditorState(loading: true)) {
    on<WorkoutEditorEvent>(_onEvent);
  }

  final AddWorkout _add;
  final UpdateWorkout _update;
  final WorkoutRepository _repo;

  Future<void> _onEvent(
    WorkoutEditorEvent event,
    Emitter<WorkoutEditorState> emit,
  ) async {
    await event.map(
      createNew: (_) async {
        emit(
          state.copyWith(
            loading: false,
            isNew: true,
            workout: Workout(date: DateTime.now(), notes: null, sets: const []),
          ),
        );
      },
      editExisting: (e) async {
        emit(state.copyWith(loading: true));
        final w = await _repo.getById(e.id);
        emit(state.copyWith(loading: false, isNew: false, workout: w));
      },
      dateChanged: (e) async {
        final w = state.workout!;
        emit(state.copyWith(workout: w.copyWith(date: e.date)));
      },
      notesChanged: (e) async {
        final w = state.workout!;
        emit(state.copyWith(workout: w.copyWith(notes: e.notes)));
      },
      addSet: (_) async {
        final w = state.workout!;
        final order = w.sets.length;
        final updated = List<WorkoutSet>.of(w.sets)
          ..add(
            WorkoutSet(
              exercise: 'Bench press',
              weight: 0,
              reps: 0,
              order: order,
            ),
          );
        emit(state.copyWith(workout: w.copyWith(sets: updated)));
      },
      updateSet: (e) async {
        final w = state.workout!;
        final updated = List<WorkoutSet>.of(w.sets);
        updated[e.index] = e.set;
        emit(state.copyWith(workout: w.copyWith(sets: updated)));
      },
      removeSet: (e) async {
        final w = state.workout!;
        final updated = List<WorkoutSet>.of(w.sets)..removeAt(e.index);
        // re-number order
        final renumbered = [
          for (var i = 0; i < updated.length; i++)
            updated[i].copyWith(order: i),
        ];
        emit(state.copyWith(workout: w.copyWith(sets: renumbered)));
      },
      save: (_) async {
        final w = state.workout!;
        emit(state.copyWith(saving: true, saveSuccess: false, error: null));
        try {
          if (state.isNew) {
            await _add(w);
          } else {
            await _update(w);
          }
          emit(state.copyWith(saving: false, saveSuccess: true));
        } catch (e) {
          emit(
            state.copyWith(
              saving: false,
              saveSuccess: false,
              error: e.toString(),
            ),
          );
        }
      },
    );
  }
}
