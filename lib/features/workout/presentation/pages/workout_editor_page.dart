import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/exercises.dart';
import '../blocs/editor/workout_editor_bloc.dart';
import '../blocs/editor/workout_editor_event.dart';
import '../blocs/editor/workout_editor_state.dart';
import '../widgets/set_tile.dart';

class WorkoutEditorPage extends StatelessWidget {
  const WorkoutEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workout',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => context.read<WorkoutEditorBloc>().add(
              const WorkoutEditorEvent.save(),
            ),
            child: Text(
              'Save',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: BlocConsumer<WorkoutEditorBloc, WorkoutEditorState>(
        listenWhen: (p, c) =>
            p.saveSuccess != c.saveSuccess || p.error != c.error,
        listener: (context, state) {
          if (state.saveSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('The workout is saved')),
            );
          }
          if (state.error != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
          }
        },
        builder: (context, state) {
          if (state.workout == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final w = state.workout!;
          // return const Center(child: CircularProgressIndicator());
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Workout title',
                        ),
                        controller: TextEditingController(text: w.notes)
                          ..selection = TextSelection.collapsed(
                            offset: w.notes?.length ?? 0,
                          ),
                        onChanged: (v) => context.read<WorkoutEditorBloc>().add(
                          WorkoutEditorEvent.notesChanged(v.isEmpty ? null : v),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    const Text('Date:'),
                    TextButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime(now.year - 5),
                          lastDate: DateTime(now.year + 5),
                          initialDate: w.date,
                        );
                        if (picked != null) {
                          context.read<WorkoutEditorBloc>().add(
                            WorkoutEditorEvent.dateChanged(picked),
                          );
                        }
                      },
                      child: Text(
                        '${w.date.toLocal().toIso8601String().substring(0, 10)}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                w.sets.length == 0
                    ? Expanded(
                        child: Center(
                          child: Text('No Set yet. Tap "ADD SET" button.'),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: w.sets.length,
                          itemBuilder: (context, index) {
                            final s = w.sets[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SetTile(
                                index: index,
                                exercises: kExercises,
                                value: s,
                                onChanged: (next) =>
                                    context.read<WorkoutEditorBloc>().add(
                                      WorkoutEditorEvent.updateSet(index, next),
                                    ),
                                onRemove: () => context
                                    .read<WorkoutEditorBloc>()
                                    .add(WorkoutEditorEvent.removeSet(index)),
                              ),
                            );
                          },
                        ),
                      ),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => context.read<WorkoutEditorBloc>().add(
                      const WorkoutEditorEvent.addSet(),
                    ),
                    style:
                        ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE6FF3F),
                          foregroundColor: Colors.black,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          elevation: 0,
                          minimumSize: const Size(0, 36),
                        ).copyWith(
                          overlayColor: WidgetStateProperty.resolveWith(
                            (s) => Colors.black.withValues(
                              alpha: s.contains(WidgetState.pressed)
                                  ? 0.08
                                  : 0.04,
                            ),
                          ),
                        ),
                    child: const Text(
                      'ADD SET',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}
