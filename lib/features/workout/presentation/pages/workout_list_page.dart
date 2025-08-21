import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_ai_assessment/features/workout/presentation/widgets/workout_list_item.dart';
import '../../../../core/router/routes.dart';
import '../blocs/list/workout_list_bloc.dart';
import '../blocs/list/workout_list_event.dart';
import '../blocs/list/workout_list_state.dart';

class WorkoutListPage extends StatelessWidget {
  const WorkoutListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 30,
          child: Image.asset('assets/images/magic_ai_logo.png'),
        ),
        toolbarHeight: 60,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(Routes.workoutNew);
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFFE6FF3F),
        // focusColor: Colors.lime,
      ),
      body: BlocBuilder<WorkoutListBloc, WorkoutListState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.items.isEmpty) {
            return const Center(child: Text('No workouts yet. Tap + to add.'));
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.separated(
              itemCount: state.items.length,
              separatorBuilder: (_, __) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(),
              ),
              itemBuilder: (context, index) {
                final w = state.items[index];
                return Dismissible(
                  key: ValueKey(w.id),
                  background: Container(color: Colors.redAccent),
                  onDismissed: (_) => context.read<WorkoutListBloc>().add(
                    WorkoutListEvent.deleted(w.id!),
                  ),
                  child: WorkoutListItem(workout: w),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
