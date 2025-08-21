import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart'
    as dom;
import 'package:magic_ai_assessment/features/workout/domain/repositories/workout_repository.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/add_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/update_workout.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/editor/workout_editor_bloc.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/editor/workout_editor_event.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/editor/workout_editor_state.dart';
import 'package:mocktail/mocktail.dart';

class MockAddWorkout extends Mock implements AddWorkout {}

class MockUpdateWorkout extends Mock implements UpdateWorkout {}

class MockRepo extends Mock implements WorkoutRepository {}

void main() {
  late MockAddWorkout add;
  late MockUpdateWorkout update;
  late MockRepo repo;

  setUpAll(() {
    registerFallbackValue(
      dom.Workout(date: DateTime(2025, 1, 1), sets: const []),
    );
  });

  setUp(() {
    add = MockAddWorkout();
    update = MockUpdateWorkout();
    repo = MockRepo();
  });

  dom.Workout sample({int? id}) => dom.Workout(
    id: id,
    date: DateTime(2025, 8, 20),
    notes: 'n',
    sets: const [],
  );

  blocTest<WorkoutEditorBloc, WorkoutEditorState>(
    'createNew initializes empty workout',
    build: () => WorkoutEditorBloc(add: add, update: update, repo: repo),
    act: (b) => b.add(const WorkoutEditorEvent.createNew()),
    expect: () => [
      isA<WorkoutEditorState>()
          .having((s) => s.loading, 'loading', false)
          .having((s) => s.isNew, 'isNew', true)
          .having((s) => s.workout != null, 'workout', true)
          .having((s) => s.workout!.sets.length, 'sets', 0),
    ],
  );

  blocTest<WorkoutEditorBloc, WorkoutEditorState>(
    'editExisting loads from repository',
    build: () {
      when(() => repo.getById(7)).thenAnswer((_) async => sample(id: 7));
      return WorkoutEditorBloc(add: add, update: update, repo: repo);
    },
    act: (b) => b.add(const WorkoutEditorEvent.editExisting(7)),
    expect: () => [
      isA<WorkoutEditorState>().having((s) => s.loading, 'loading', true),
      isA<WorkoutEditorState>()
          .having((s) => s.loading, 'loading', false)
          .having((s) => s.isNew, 'isNew', false)
          .having((s) => s.workout?.id, 'id', 7),
    ],
  );

  blocTest<WorkoutEditorBloc, WorkoutEditorState>(
    'addSet / removeSet adjust sets and order',
    build: () => WorkoutEditorBloc(add: add, update: update, repo: repo),
    act: (b) {
      b
        ..add(const WorkoutEditorEvent.createNew())
        ..add(const WorkoutEditorEvent.addSet())
        ..add(const WorkoutEditorEvent.addSet())
        ..add(const WorkoutEditorEvent.removeSet(0));
    },
    verify: (b) {
      final sets = b.state.workout!.sets;
      expect(sets.length, 1);
      expect(sets.single.order, 0);
    },
  );

  blocTest<WorkoutEditorBloc, WorkoutEditorState>(
    'save new calls AddWorkout and toggles saving flags',
    build: () {
      when(() => add(any())).thenAnswer((_) async => 1);
      return WorkoutEditorBloc(add: add, update: update, repo: repo);
    },
    act: (b) async {
      b
        ..add(const WorkoutEditorEvent.createNew())
        ..add(const WorkoutEditorEvent.save());
      await Future<void>.delayed(const Duration(milliseconds: 10));
    },
    verify: (_) => verify(() => add(any())).called(1),
  );

  blocTest<WorkoutEditorBloc, WorkoutEditorState>(
    'save existing calls UpdateWorkout',
    build: () {
      when(() => repo.getById(1)).thenAnswer((_) async => sample(id: 1));
      when(() => update(any())).thenAnswer((_) async {});
      return WorkoutEditorBloc(add: add, update: update, repo: repo);
    },
    act: (b) async {
      b
        ..add(const WorkoutEditorEvent.editExisting(1))
        ..add(const WorkoutEditorEvent.save());
      await Future<void>.delayed(const Duration(milliseconds: 10));
    },
    verify: (_) => verify(() => update(any())).called(1),
  );
}
