import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/delete_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/watch_workouts.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/list/workout_list_bloc.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/list/workout_list_event.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/list/workout_list_state.dart';
import 'package:mocktail/mocktail.dart';

class MockWatchWorkouts extends Mock implements WatchWorkouts {}

class MockDeleteWorkout extends Mock implements DeleteWorkout {}

void main() {
  late MockWatchWorkouts watch;
  late MockDeleteWorkout del;
  late StreamController<List<Workout>> controller;

  setUp(() {
    watch = MockWatchWorkouts();
    del = MockDeleteWorkout();
    controller = StreamController<List<Workout>>();
  });

  tearDown(() async {
    await controller.close();
  });

  Workout sample() =>
      Workout(id: 1, date: DateTime(2025, 8, 20), notes: 'x', sets: const []);

  blocTest<WorkoutListBloc, WorkoutListState>(
    'emits loading then items from stream',
    build: () {
      when(() => watch()).thenAnswer((_) => controller.stream);
      return WorkoutListBloc(watch: watch, delete: del);
    },
    act: (bloc) {
      bloc.add(const WorkoutListEvent.started());
      controller.add([sample()]);
    },
    expect: () => [
      isA<WorkoutListState>().having((s) => s.loading, 'loading', true),
      isA<WorkoutListState>()
          .having((s) => s.loading, 'loading', false)
          .having((s) => s.items.length, 'items', 1),
    ],
  );
}
