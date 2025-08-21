import '../../domain/entities/workout.dart';
import '../../domain/repositories/workout_repository.dart';
import '../mappers/workout_mapper.dart';
import '../sources/local/workout_local_source.dart';

class WorkoutRepositoryDrift implements WorkoutRepository {
  final WorkoutLocalSource _local;
  WorkoutRepositoryDrift(this._local);

  @override
  Future<int> create(Workout workout) async {
    final workoutCompanion = WorkoutMapper.toWorkoutCompanion(workout);
    final setCompanions = WorkoutMapper.toSetCompanions(workout);
    return _local.dao.insertWorkout(
      workout: workoutCompanion,
      sets: setCompanions,
    );
  }

  @override
  Future<void> update(Workout workout) async {
    final id = workout.id!;
    final workoutCompanion = WorkoutMapper.toWorkoutCompanion(workout);
    final setCompanions = WorkoutMapper.toSetCompanions(workout);
    await _local.dao.updateWorkoutFull(
      workoutId: id,
      workout: workoutCompanion,
      sets: setCompanions,
    );
  }

  @override
  Future<void> delete(int id) => _local.dao.deleteWorkout(id);

  @override
  Stream<List<Workout>> watchAll() {
    return _local.dao.watchAll().map(
      (rows) => rows.map(WorkoutMapper.fromDao).toList(),
    );
  }

  @override
  Future<Workout?> getById(int id) async {
    final row = await _local.dao.getById(id);
    if (row == null) return null;
    return WorkoutMapper.fromDao(row);
  }
}
