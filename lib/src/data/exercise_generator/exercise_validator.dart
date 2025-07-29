import 'dart:math';

import 'package:the_kids_app/src/data/dtos/exercise/exercise_dto.dart';

class ExerciseValidator {
  /// Helper function to calculate the frequency of items in a list.
  static Map<String, int> _getFrequencyMap(List<String> items) {
    final Map<String, int> counts = {};
    for (final item in items) {
      counts[item] = (counts[item] ?? 0) + 1;
    }
    return counts;
  }

  static ExerciseDto? correctExerciseDto(ExerciseDto dto) {
    return dto.when(
      matchWord: (targetGermanWord, englishOptions, correctEnglishWord) {
        if (targetGermanWord.isEmpty || correctEnglishWord.isEmpty) {
          return null;
        }

        List<String> updatedOptions = List.from(englishOptions);
        if (!updatedOptions.contains(correctEnglishWord)) {
          updatedOptions.add(correctEnglishWord);
        }
        if (updatedOptions.isEmpty) {
          return null;
        }
        updatedOptions = _shuffleList(updatedOptions);

        return ExerciseDto.matchWord(
          targetGermanWord: targetGermanWord,
          englishOptions: updatedOptions,
          correctEnglishWord: correctEnglishWord,
        );
      },
      listenChoose: (targetGermanWord, germanOptions) {
        if (targetGermanWord.isEmpty) {
          return null;
        }

        List<String> updatedOptions = List.from(germanOptions);
        if (!updatedOptions.contains(targetGermanWord)) {
          updatedOptions.add(targetGermanWord);
        }
        if (updatedOptions.isEmpty) {
          return null;
        }
        updatedOptions = _shuffleList(updatedOptions);

        return ExerciseDto.listenChoose(
          targetGermanWord: targetGermanWord,
          germanOptions: updatedOptions,
        );
      },
      spellWord: (targetGermanWord, scrambledLetters, englishTranslation) {
        if (targetGermanWord.isEmpty || englishTranslation.isEmpty) {
          return null;
        }

        // 1. Filter out non-single-letter items and normalize to lowercase.
        List<String> cleanedScrambledLetters = scrambledLetters
            .where((letter) => letter.length == 1)
            .map((letter) => letter.toLowerCase())
            .toList();

        // 2. Get the canonical letters from the target word, normalized and with correct frequencies.
        List<String> targetLetters = targetGermanWord.toLowerCase().split('');

        // Calculate frequencies for target letters
        final Map<String, int> targetLetterCounts = _getFrequencyMap(
          targetLetters,
        );
        // Calculate frequencies for currently available scrambled letters (after initial cleaning)
        final Map<String, int> currentScrambledLetterCounts = _getFrequencyMap(
          cleanedScrambledLetters,
        );

        // 3. Add any missing characters based on their required frequency.
        List<String> charactersToAdd = [];
        targetLetterCounts.forEach((letter, requiredCount) {
          final int currentCount = currentScrambledLetterCounts[letter] ?? 0;
          if (currentCount < requiredCount) {
            final int missingCount = requiredCount - currentCount;
            for (int i = 0; i < missingCount; i++) {
              charactersToAdd.add(letter);
            }
          }
        });

        if (charactersToAdd.isNotEmpty) {
          cleanedScrambledLetters.addAll(charactersToAdd);
        }

        // Final check: if target word has letters but the options list is now empty, it's unfixable.
        if (targetLetters.isNotEmpty && cleanedScrambledLetters.isEmpty) {
          return null;
        }

        cleanedScrambledLetters = _shuffleList(cleanedScrambledLetters);

        return ExerciseDto.spellWord(
          targetGermanWord: targetGermanWord,
          scrambledLetters: cleanedScrambledLetters,
          englishTranslation: englishTranslation,
        );
      },
      sentenceScramble: (targetGermanSentence, englishTranslation, scrambledWords) {
        if (targetGermanSentence.isEmpty || englishTranslation.isEmpty) {
          return null;
        }

        // 1. Get the canonical words from the target sentence, preserving punctuation.
        // This ensures words like "Buch." are treated as distinct from "Buch".
        List<String> canonicalTargetWords = targetGermanSentence
            .split(RegExp(r'\s+'))
            .where((word) => word.isNotEmpty)
            .toList();

        // Calculate frequencies for canonical target words.
        final Map<String, int> targetWordCounts = _getFrequencyMap(
          canonicalTargetWords,
        );

        // 2. Filter Gemma's provided `scrambledWords` based on canonical words and their frequencies.
        List<String> filteredGemmaScrambledWords = [];
        final Map<String, int> filteredGemmaWordCounts =
            {}; // To track counts of words added from Gemma

        for (String gemmaWord in scrambledWords) {
          // Only add the gemmaWord if it's a canonical target word AND
          // we haven't already added enough instances of this word based on targetWordCounts.
          if (targetWordCounts.containsKey(gemmaWord)) {
            final int currentCountInFiltered =
                filteredGemmaWordCounts[gemmaWord] ?? 0;
            if (currentCountInFiltered < targetWordCounts[gemmaWord]!) {
              filteredGemmaScrambledWords.add(gemmaWord);
              filteredGemmaWordCounts[gemmaWord] = currentCountInFiltered + 1;
            }
          }
        }

        // 3. Build the final `scrambledWords` list.
        List<String> finalScrambledOptions = List.from(
          filteredGemmaScrambledWords,
        );

        // 4. Add any missing canonical words based on their required frequency.
        List<String> wordsToAdd = [];
        targetWordCounts.forEach((word, requiredCount) {
          final int currentCount = filteredGemmaWordCounts[word] ?? 0;
          if (currentCount < requiredCount) {
            final int missingCount = requiredCount - currentCount;
            for (int i = 0; i < missingCount; i++) {
              wordsToAdd.add(word);
            }
          }
        });

        if (wordsToAdd.isNotEmpty) {
          finalScrambledOptions.addAll(wordsToAdd);
        }

        // Final check: If target sentence has words but the corrected options list is empty, it's unfixable.
        if (canonicalTargetWords.isNotEmpty && finalScrambledOptions.isEmpty) {
          return null;
        }

        finalScrambledOptions = _shuffleList(finalScrambledOptions);

        return ExerciseDto.sentenceScramble(
          targetGermanSentence: targetGermanSentence,
          englishTranslation: englishTranslation,
          scrambledWords: finalScrambledOptions,
        );
      },
    );
  }

  static List<T> _shuffleList<T>(List<T> list) {
    final newList = List<T>.from(list);
    newList.shuffle(Random());
    return newList;
  }
}
