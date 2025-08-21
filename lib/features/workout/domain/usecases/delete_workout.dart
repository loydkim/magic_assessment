import '../repositories/workout_repository.dart';

class DeleteWorkout {
  final WorkoutRepository _repo;
  DeleteWorkout(this._repo);
  Future<void> call(int id) => _repo.delete(id);
}
