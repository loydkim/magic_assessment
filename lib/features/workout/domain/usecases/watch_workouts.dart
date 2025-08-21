import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

class WatchWorkouts {
  final WorkoutRepository _repo;
  WatchWorkouts(this._repo);
  Stream<List<Workout>> call() => _repo.watchAll();
}
