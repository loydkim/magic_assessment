import 'package:magic_ai_assessment/core/db/daos/workout_dao.dart';

class WorkoutLocalSource {
  final WorkoutDao _dao;
  WorkoutLocalSource(this._dao);

  WorkoutDao get dao => _dao;
}
