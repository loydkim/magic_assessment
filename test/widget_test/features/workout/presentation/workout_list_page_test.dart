import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/delete_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/watch_workouts.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/list/workout_list_bloc.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/list/workout_list_event.dart';
import 'package:magic_ai_assessment/features/workout/presentation/pages/workout_list_page.dart';
import 'package:mocktail/mocktail.dart';

class MockWatchWorkouts extends Mock implements WatchWorkouts {}

class MockDeleteWorkout extends Mock implements DeleteWorkout {}

GoRouter _router(Widget child) => GoRouter(
  initialLocation: '/workouts',
  routes: [
    GoRoute(path: '/workouts', builder: (context, state) => child),
    GoRoute(
      path: '/workouts/new',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('NEW'))),
    ),
    GoRoute(
      path: '/workouts/:id',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('DETAIL'))),
    ),
  ],
);

Workout sample(int id) =>
    Workout(id: id, date: DateTime(2025, 8, 20), sets: const []);

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
  testWidgets('shows loading then list items and navigates on FAB', (
    tester,
  ) async {
    when(() => watch()).thenAnswer((_) => controller.stream);
    when(() => del.call(any())).thenAnswer((_) async {});

    final bloc = WorkoutListBloc(watch: watch, delete: del)
      ..add(const WorkoutListEvent.started());

    final app = MaterialApp.router(
      routerConfig: _router(
        BlocProvider.value(value: bloc, child: const WorkoutListPage()),
      ),
    );

    await tester.pumpWidget(app);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    controller.add([sample(1)]);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('2025-08-20'), findsOneWidget);
    expect(find.text('0 sets'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('NEW'), findsOneWidget);
  });
}
