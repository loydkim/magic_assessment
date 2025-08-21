import 'package:flutter_test/flutter_test.dart';
import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/repositories/workout_repository.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/add_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/delete_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/update_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/watch_workouts.dart';
import 'package:mocktail/mocktail.dart';

class MockRepo extends Mock implements WorkoutRepository {}

void main() {
  late MockRepo repo;

  setUp(() {
    repo = MockRepo();
    registerFallbackValue(Workout(date: DateTime(2025, 1, 1), sets: const []));
  });

  test('AddWorkout delegates to repository', () async {
    final uc = AddWorkout(repo);
    when(() => repo.create(any())).thenAnswer((_) async => 123);
    final id = await uc(Workout(date: DateTime(2025, 1, 1), sets: const []));
    expect(id, 123);
  });

  test('UpdateWorkout delegates to repository', () async {
    final uc = UpdateWorkout(repo);
    when(() => repo.update(any())).thenAnswer((_) async {});
    await uc(Workout(id: 1, date: DateTime(2025, 1, 1), sets: const []));
    verify(() => repo.update(any())).called(1);
  });

  test('DeleteWorkout delegates to repository', () async {
    final uc = DeleteWorkout(repo);
    when(() => repo.delete(7)).thenAnswer((_) async {});
    await uc(7);
    verify(() => repo.delete(7)).called(1);
  });

  test('WatchWorkouts delegates to repository', () async {
    final uc = WatchWorkouts(repo);
    when(
      () => repo.watchAll(),
    ).thenAnswer((_) => Stream.value(const <Workout>[]));
    final items = await uc().first;
    expect(items, isEmpty);
  });
}
