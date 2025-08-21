import 'package:flutter_test/flutter_test.dart';
import 'package:magic_ai_assessment/core/db/daos/workout_dao.dart';
import 'package:magic_ai_assessment/features/workout/data/repositories/workout_repository_drift.dart';
import 'package:magic_ai_assessment/features/workout/data/sources/local/workout_local_source.dart';
import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart'
    as dom;
import 'package:magic_ai_assessment/features/workout/domain/entities/workout_set.dart';
import '../../../helpers/test_utils.dart';

void main() {
  test('create and watchAll maps to domain correctly', () async {
    final db = makeTestDb();
    final dao = WorkoutDao(db);
    final repo = WorkoutRepositoryDrift(WorkoutLocalSource(dao));

    final w = dom.Workout(
      date: DateTime(2025, 8, 20),
      notes: 'Chest day',
      sets: const [
        WorkoutSet(exercise: 'Bench press', weight: 40, reps: 10, order: 0),
        WorkoutSet(exercise: 'Bench press', weight: 45, reps: 8, order: 1),
      ],
    );

    final id = await repo.create(w);
    expect(id, isNonNegative);

    final items = await repo.watchAll().first;
    expect(items.length, 1);
    expect(items.first.sets.length, 2);

    await db.close();
  });
}
