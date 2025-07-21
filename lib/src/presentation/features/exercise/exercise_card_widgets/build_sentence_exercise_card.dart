import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart';

class BuildSentenceExerciseCard extends StatelessWidget {
  final BuildSentenceExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const BuildSentenceExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade100,
      margin: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Build a Sentence Exercise',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Available Words: ${data.availableWords.join(', ')}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement actual game logic for Build a Sentence
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Starting Build a Sentence!')),
                );
              },
              child: const Text('Build It!'),
            ),
          ],
        ),
      ),
    );
  }
}
