import 'package:flutter/material.dart';
import 'package:the_kids_app/src/domain/entities/exercise/exercise_entity.dart';
import 'package:the_kids_app/src/presentation/features/exercise/exercise_type.dart';

class SpellWordExerciseCard extends StatelessWidget {
  final SpellWordExerciseEntity data;
  final Function(bool isCorrect, ExerciseType type) onAnswerSubmitted;

  const SpellWordExerciseCard({
    super.key,
    required this.data,
    required this.onAnswerSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade100,
      margin: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Spell the Word Exercise',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Word to Spell: ${data.wordToSpell.wordDe}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement actual game logic for Spell the Word
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Starting Spell the Word game!'),
                  ),
                );
              },
              child: const Text('Start Spelling!'),
            ),
          ],
        ),
      ),
    );
  }
}
