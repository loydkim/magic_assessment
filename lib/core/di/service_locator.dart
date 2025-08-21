import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_ai_assessment/core/db/app_database.dart';
import 'package:magic_ai_assessment/core/db/daos/workout_dao.dart';
import 'package:magic_ai_assessment/features/workout/data/repositories/workout_repository_drift.dart';
import 'package:magic_ai_assessment/features/workout/data/sources/local/workout_local_source.dart';
import 'package:magic_ai_assessment/features/workout/domain/repositories/workout_repository.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/add_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/delete_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/update_workout.dart';
import 'package:magic_ai_assessment/features/workout/domain/usecases/watch_workouts.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/editor/workout_editor_event.dart';
import 'package:magic_ai_assessment/features/workout/presentation/blocs/list/workout_list_event.dart';
import '../router/routes.dart';
import '../../features/workout/presentation/pages/workout_list_page.dart';
import '../../features/workout/presentation/pages/workout_editor_page.dart';
import '../../features/workout/presentation/blocs/list/workout_list_bloc.dart';
import '../../features/workout/presentation/blocs/editor/workout_editor_bloc.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // DB & DAO
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  sl.registerLazySingleton<WorkoutDao>(() => WorkoutDao(sl()));

  // Data sources & repositories
  sl.registerLazySingleton<WorkoutLocalSource>(() => WorkoutLocalSource(sl()));
  sl.registerLazySingleton<WorkoutRepository>(
    () => WorkoutRepositoryDrift(sl()),
  );

  // Use cases
  sl.registerFactory(() => AddWorkout(sl()));
  sl.registerFactory(() => UpdateWorkout(sl()));
  sl.registerFactory(() => DeleteWorkout(sl()));
  sl.registerFactory(() => WatchWorkouts(sl()));

  // Router
  sl.registerLazySingleton<GoRouter>(
    () => GoRouter(
      initialLocation: Routes.workouts, // '/workouts'
      routes: [
        GoRoute(
          path: Routes.workouts, // '/workouts'
          builder: (context, state) => BlocProvider(
            create: (_) =>
                WorkoutListBloc(watch: sl(), delete: sl())
                  ..add(const WorkoutListEvent.started()),
            child: const WorkoutListPage(),
          ),
          routes: [
            // /workouts/new
            GoRoute(
              path: 'new',
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    WorkoutEditorBloc(add: sl(), update: sl(), repo: sl())
                      ..add(const WorkoutEditorEvent.createNew()),
                child: const WorkoutEditorPage(),
              ),
            ),
            // /workouts/:id
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id']!);
                return BlocProvider(
                  create: (_) =>
                      WorkoutEditorBloc(add: sl(), update: sl(), repo: sl())
                        ..add(WorkoutEditorEvent.editExisting(id)),
                  child: const WorkoutEditorPage(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  );
}
