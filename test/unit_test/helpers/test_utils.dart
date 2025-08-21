import 'package:drift/native.dart';
import 'package:magic_ai_assessment/core/db/app_database.dart';

/// In-memory database for unit tests.
AppDatabase makeTestDb() => AppDatabase.testing(NativeDatabase.memory());
