import 'package:flutter/material.dart';
import '../../domain/entities/workout_set.dart';

class SetTile extends StatelessWidget {
  const SetTile({
    super.key,
    required this.index,
    required this.exercises,
    required this.value,
    required this.onChanged,
    required this.onRemove,
  });
  final int index;
  final List<String> exercises;
  final WorkoutSet value;
  final ValueChanged<WorkoutSet> onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Set ${index + 1}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: onRemove,
                      child: Icon(Icons.delete_outline),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: exercises.contains(value.exercise)
                        ? value.exercise
                        : exercises.first,
                    items: exercises
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) onChanged(value.copyWith(exercise: v));
                    },
                    decoration: const InputDecoration(labelText: 'Exercise'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: value.weight.toStringAsFixed(1),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(labelText: 'Weight (kg)'),
                    onChanged: (v) {
                      final d = double.tryParse(v) ?? 0;
                      onChanged(value.copyWith(weight: d));
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    initialValue: value.reps.toString(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Reps'),
                    onChanged: (v) {
                      final i = int.tryParse(v) ?? 0;
                      onChanged(value.copyWith(reps: i));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
