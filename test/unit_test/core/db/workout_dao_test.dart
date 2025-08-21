import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:magic_ai_assessment/core/db/app_database.dart';
import 'package:magic_ai_assessment/core/db/daos/workout_dao.dart';

import '../../helpers/test_utils.dart';

void main() {
  late AppDatabase db;
  late WorkoutDao dao;

  setUp(() {
    db = makeTestDb();
    dao = WorkoutDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('insert/get/delete workout with sets', () async {
    final id = await dao.insertWorkout(
      workout: WorkoutsCompanion(
        date: Value(DateTime(2025, 8, 20)),
        notes: const Value('Chest + Deadlift'),
      ),
      sets: [
        WorkoutSetsCompanion(
          exercise: const Value('Bench press'),
          weight: const Value(40),
          reps: const Value(10),
          order: const Value(0),
        ),
        WorkoutSetsCompanion(
          exercise: const Value('Deadlift'),
          weight: const Value(70),
          reps: const Value(8),
          order: const Value(1),
        ),
      ],
    );

    final loaded = await dao.getById(id);
    expect(loaded, isNotNull);
    expect(loaded!.sets.length, 2);

    await dao.deleteWorkout(id);
    final afterDelete = await dao.getById(id);
    expect(afterDelete, isNull);
  });

  test('watchAll emits items in desc date order', () async {
    await dao.insertWorkout(
      workout: WorkoutsCompanion(
        date: Value(DateTime(2025, 8, 19)),
        notes: const Value('A'),
      ),
      sets: const [],
    );
    await dao.insertWorkout(
      workout: WorkoutsCompanion(
        date: Value(DateTime(2025, 8, 20)),
        notes: const Value('B'),
      ),
      sets: const [],
    );

    final first = await dao.watchAll().first;
    expect(first.length, 2);
    expect(first.first.workout.date, DateTime(2025, 8, 20));
  });

  test('updateWorkoutFull replaces sets', () async {
    final id = await dao.insertWorkout(
      workout: WorkoutsCompanion(date: Value(DateTime(2025, 8, 20))),
      sets: [
        WorkoutSetsCompanion(
          exercise: const Value('Bench press'),
          weight: const Value(40),
          reps: const Value(10),
          order: const Value(0),
        ),
      ],
    );

    await dao.updateWorkoutFull(
      workoutId: id,
      workout: const WorkoutsCompanion(notes: Value('updated')),
      sets: [
        WorkoutSetsCompanion(
          exercise: const Value('Deadlift'),
          weight: const Value(80),
          reps: const Value(5),
          order: const Value(0),
        ),
      ],
    );

    final updated = await dao.getById(id);
    expect(updated!.workout.notes, 'updated');
    expect(updated.sets.single.exercise, 'Deadlift');
  });
}
