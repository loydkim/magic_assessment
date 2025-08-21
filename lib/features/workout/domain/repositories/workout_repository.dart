import '../entities/workout.dart';

abstract class WorkoutRepository {
  Future<int> create(Workout workout);
  Future<void> update(Workout workout);
  Future<void> delete(int id);
  Stream<List<Workout>> watchAll();
  Future<Workout?> getById(int id);
}
