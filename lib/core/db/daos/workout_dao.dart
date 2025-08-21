import 'package:drift/drift.dart';
import 'package:magic_ai_assessment/core/db/app_database.dart';
import 'package:magic_ai_assessment/core/db/tables/workout_sets_table.dart';
import 'package:magic_ai_assessment/core/db/tables/workouts_table.dart';

part 'workout_dao.g.dart';

class WorkoutWithSets {
  final Workout workout;
  final List<WorkoutSet> sets;
  WorkoutWithSets(this.workout, this.sets);
}

@DriftAccessor(tables: [Workouts, WorkoutSets])
class WorkoutDao extends DatabaseAccessor<AppDatabase> with _$WorkoutDaoMixin {
  WorkoutDao(AppDatabase db) : super(db);

  Stream<List<WorkoutWithSets>> watchAll() {
    final q = (select(
      workouts,
    )..orderBy([(t) => OrderingTerm.desc(t.date)])).watch();
    return q.asyncMap((ws) async {
      final result = <WorkoutWithSets>[];
      for (final w in ws) {
        final children =
            await (select(workoutSets)
                  ..where((s) => s.workoutId.equals(w.id))
                  ..orderBy([(s) => OrderingTerm.asc(s.order)]))
                .get();
        result.add(WorkoutWithSets(w, children));
      }
      return result;
    });
  }

  Future<WorkoutWithSets?> getById(int id) async {
    final w = await (select(
      workouts,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (w == null) return null;
    final children =
        await (select(workoutSets)
              ..where((s) => s.workoutId.equals(id))
              ..orderBy([(s) => OrderingTerm.asc(s.order)]))
            .get();
    return WorkoutWithSets(w, children);
  }

  Future<int> insertWorkout({
    required WorkoutsCompanion workout,
    required List<WorkoutSetsCompanion> sets,
  }) async {
    return transaction(() async {
      final id = await into(workouts).insert(workout);
      for (final s in sets) {
        await into(workoutSets).insert(s.copyWith(workoutId: Value(id)));
      }
      return id;
    });
  }

  Future<void> updateWorkoutFull({
    required int workoutId,
    required WorkoutsCompanion workout,
    required List<WorkoutSetsCompanion> sets,
  }) async {
    return transaction(() async {
      await (update(
        workouts,
      )..where((t) => t.id.equals(workoutId))).write(workout);
      await (delete(
        workoutSets,
      )..where((s) => s.workoutId.equals(workoutId))).go();
      for (final s in sets) {
        await into(workoutSets).insert(s.copyWith(workoutId: Value(workoutId)));
      }
    });
  }

  Future<void> deleteWorkout(int id) async {
    await (delete(workouts)..where((t) => t.id.equals(id))).go();
  }
}
