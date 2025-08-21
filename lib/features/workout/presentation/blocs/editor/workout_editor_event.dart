import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/workout_set.dart';
part 'workout_editor_event.freezed.dart';

@freezed
class WorkoutEditorEvent with _$WorkoutEditorEvent {
  const factory WorkoutEditorEvent.createNew() = _CreateNew;
  const factory WorkoutEditorEvent.editExisting(int id) = _EditExisting;
  const factory WorkoutEditorEvent.dateChanged(DateTime date) = _DateChanged;
  const factory WorkoutEditorEvent.notesChanged(String? notes) = _NotesChanged;
  const factory WorkoutEditorEvent.addSet() = _AddSet;
  const factory WorkoutEditorEvent.updateSet(int index, WorkoutSet set) =
      _UpdateSet;
  const factory WorkoutEditorEvent.removeSet(int index) = _RemoveSet;
  const factory WorkoutEditorEvent.save() = _Save;
}
