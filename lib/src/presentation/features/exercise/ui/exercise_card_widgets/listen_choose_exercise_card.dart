import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart';

class ListenChooseExerciseCard extends StatelessWidget {
  final ListenChooseExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const ListenChooseExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade100,
      margin: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Listen and Choose Exercise',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Target Word: ${data.targetWord.wordDe}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Options: ${data.options.map((w) => w.wordDe).join(', ')}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement actual game logic for Listen and Choose
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Playing audio for Listen & Choose!'),
                  ),
                );
              },
              child: const Text('Play Audio & Choose!'),
            ),
          ],
        ),
      ),
    );
  }
}
