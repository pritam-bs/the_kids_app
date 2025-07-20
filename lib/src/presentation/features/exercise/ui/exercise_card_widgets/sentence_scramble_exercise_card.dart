import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart';

class SentenceScrambleExerciseCard extends StatelessWidget {
  final SentenceScrambleExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const SentenceScrambleExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade100,
      margin: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sentence Scramble Exercise',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Scrambled: "${data.scrambledSentenceDe}"',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement actual game logic for Sentence Scramble
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Starting Sentence Scramble!')),
                );
              },
              child: const Text('Unscramble!'),
            ),
          ],
        ),
      ),
    );
  }
}
