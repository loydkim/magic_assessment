import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_ai_assessment/core/constants/exercises.dart';
import 'package:magic_ai_assessment/features/workout/domain/entities/workout.dart';

const Map<String, String> kExerciseAsset = {
  'barbell row': 'assets/images/barbell_row.png',
  'bench press': 'assets/images/bench_press.png',
  'shoulder press': 'assets/images/shoulder_press.png',
  'deadlift': 'assets/images/deadlift.png',
  'squat': 'assets/images/squat.png',
};

const List<Color> kGradientDefault = [Color(0xFF6BEA9E), Color(0xFF61C8FF)];

const Map<String, List<Color>> kExerciseGradient = {
  'barbell row': [Color(0xFF6BEA9E), Color(0xFF61C8FF)], // green → blue
  'bench press': [
    Color.fromARGB(255, 119, 104, 255),
    Color.fromARGB(255, 92, 63, 255),
  ], // yellow → amber
  'shoulder press': [Color(0xFFB993D6), Color(0xFF8CA6DB)], // lilac → sky
  'deadlift': [Color(0xFFFF6B6B), Color(0xFFFF8E53)], // coral → orange
  'squat': [Color(0xFF00C9A7), Color(0xFF00DBDE)], // teal → cyan
};

class WorkoutListItem extends StatelessWidget {
  const WorkoutListItem({super.key, required this.workout});

  final Workout workout;

  String pickWorkoutHeroAsset(Workout workout) {
    if (workout.sets.isEmpty) return 'assets/images/barbell_row.png';
    final present = workout.sets
        .map((s) => s.exercise.trim().toLowerCase())
        .toSet();
    for (final ex in kExercises) {
      final key = ex.toLowerCase();
      if (present.contains(key)) {
        return kExerciseAsset[key] ?? _assetFromName(ex);
      }
    }
    return 'assets/images/barbell_row.png';
  }

  List<Color> pickWorkoutGradient(Workout workout) {
    if (workout.sets.isEmpty) return kGradientDefault;
    final present = workout.sets
        .map((s) => s.exercise.trim().toLowerCase())
        .toSet();
    for (final ex in kExercises) {
      final key = ex.toLowerCase();
      if (present.contains(key)) {
        return kExerciseGradient[key] ?? kGradientDefault;
      }
    }
    return kGradientDefault;
  }

  String _assetFromName(String name) {
    final slug = name
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
    return 'assets/images/$slug.png';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => context.go('/workouts/${workout.id}'),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: pickWorkoutGradient(workout),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -40,
                  top: -8,
                  bottom: -8,
                  child: Image.asset(
                    pickWorkoutHeroAsset(workout),
                    width: 260,
                    fit: BoxFit.contain,
                  ),
                ),

                Positioned(
                  left: 22,
                  top: 22,
                  right: 110,
                  child: DefaultTextStyle(
                    style: const TextStyle(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workout.notes ?? "Title",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 26,
                            height: 1.08,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        const SizedBox(height: 4),
                        Text(
                          '${workout.sets.length} sets',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 54),
                        Text(
                          workout.date.toLocal().toIso8601String().substring(
                            0,
                            10,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: const SizedBox.expand(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
