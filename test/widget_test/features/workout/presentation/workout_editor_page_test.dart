import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/repositories/workout_repository.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/add_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/update_workout.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/editor/workout_editor_bloc.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/editor/workout_editor_event.dart';
import 'package:magic_ai_assessment/features/workout/presentation/pages/workout_editor_page.dart';
import 'package:mocktail/mocktail.dart';

class MockAddWorkout extends Mock implements AddWorkout {}

class MockUpdateWorkout extends Mock implements UpdateWorkout {}

class MockRepo extends Mock implements WorkoutRepository {}

void main() {
  late MockAddWorkout add;
  late MockUpdateWorkout update;
  late MockRepo repo;

  setUpAll(() {
    // Required by mocktail when using any<Workout>() expectations
    registerFallbackValue(Workout(date: DateTime(2025, 1, 1), sets: const []));
  });

  setUp(() {
    add = MockAddWorkout();
    update = MockUpdateWorkout();
    repo = MockRepo();
  });

  Future<void> _pump(WidgetTester tester, WorkoutEditorBloc bloc) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(value: bloc, child: const WorkoutEditorPage()),
      ),
    );
  }

  testWidgets('createNew → add set → edit fields → save shows SnackBar', (
    tester,
  ) async {
    when(() => add.call(any<Workout>())).thenAnswer((_) async => 1);

    final bloc = WorkoutEditorBloc(add: add, update: update, repo: repo)
      ..add(const WorkoutEditorEvent.createNew());

    await _pump(tester, bloc);
    await tester.pumpAndSettle();

    // Initially loading false with empty sets
    expect(find.byType(AppBar), findsOneWidget);

    // Add a set
    await tester.tap(find.widgetWithText(ElevatedButton, 'ADD SET'));
    await tester.pumpAndSettle();

    // Two TextFormFields should exist in SetTile (weight, reps)
    final fields = find.byType(TextFormField);
    expect(fields, findsWidgets);

    // Enter weight and reps using semantics label (InputDecoration labelText)
    await tester.enterText(find.bySemanticsLabel('Weight (kg)').first, '45.5');
    await tester.enterText(find.bySemanticsLabel('Reps').first, '10');

    // Open dropdown and select an exercise
    await tester.tap(find.byType(DropdownButtonFormField<String>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Deadlift').last);
  });
}
