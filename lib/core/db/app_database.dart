import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/workouts_table.dart';
import 'tables/workout_sets_table.dart';
import 'daos/workout_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Workouts, WorkoutSets], daos: [WorkoutDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Extra constructor for unit tests with in-memory DB
  AppDatabase.testing(QueryExecutor executor) : super(executor);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'magic_workout.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
