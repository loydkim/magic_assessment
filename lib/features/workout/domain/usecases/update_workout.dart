import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

class UpdateWorkout {
  final WorkoutRepository _repo;
  UpdateWorkout(this._repo);
  Future<void> call(Workout workout) => _repo.update(workout);
}
