import 'package:drift/drift.dart' show Value;
import 'package:magic_ai_assessment/core/db/app_database.dart'
    show WorkoutsCompanion, WorkoutSetsCompanion;

import '../../../../core/db/daos/workout_dao.dart' as d;
import '../../domain/entities/workout.dart';
import '../../domain/entities/workout_set.dart';

class WorkoutMapper {
  static Workout fromDao(d.WorkoutWithSets row) {
    return Workout(
      id: row.workout.id,
      date: row.workout.date,
      notes: row.workout.notes,
      sets: row.sets
          .map(
            (s) => WorkoutSet(
              id: s.id,
              exercise: s.exercise,
              weight: s.weight,
              reps: s.reps,
              order: s.order,
            ),
          )
          .toList(),
    );
  }

  static WorkoutsCompanion toWorkoutCompanion(Workout w) =>
      WorkoutsCompanion(date: Value(w.date), notes: Value(w.notes));

  static List<WorkoutSetsCompanion> toSetCompanions(Workout w) => w.sets
      .map(
        (s) => WorkoutSetsCompanion(
          exercise: Value(s.exercise),
          weight: Value(s.weight),
          reps: Value(s.reps),
          order: Value(s.order),
        ),
      )
      .toList();
}
