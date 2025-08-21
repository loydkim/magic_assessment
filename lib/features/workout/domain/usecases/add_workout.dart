import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

class AddWorkout {
  final WorkoutRepository _repo;
  AddWorkout(this._repo);
  Future<int> call(Workout workout) => _repo.create(workout);
}
