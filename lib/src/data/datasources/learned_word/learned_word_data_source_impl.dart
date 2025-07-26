import 'dart:async';

import 'package:the_kids_app/objectbox.g.dart';
import 'package:the_kids_app/src/data/datasources/learned_word/learned_word_data_source.dart';
import 'package:the_kids_app/src/data/dtos/learned_word/learned_word_dto.dart';

class LearnedWordDataSourceImpl implements LearnedWordDataSource {
  final Box<LearnedWordDto> _learnedWordBox;
  final StreamController<LearnedWordDto> _newWordsController =
      StreamController<LearnedWordDto>.broadcast();

  LearnedWordDataSourceImpl(this._learnedWordBox);

  @override
  Future<void> insertWord(LearnedWordDto learnedWordDto) async {
    final query = _learnedWordBox
        .query(LearnedWordDto_.word.equals(learnedWordDto.word))
        .build();
    final existingWord = query.findFirst();
    query.close();

    if (existingWord == null) {
      _learnedWordBox.put(learnedWordDto);
      _newWordsController.add(learnedWordDto);
    }
  }

  @override
  Future<LearnedWordDto?> getWord(String word) async {
    final query = _learnedWordBox
        .query(LearnedWordDto_.word.equals(word))
        .build();
    final result = query.findFirst();
    query.close();
    return result;
  }

  @override
  Future<List<LearnedWordDto>> getAllWords() async {
    return _learnedWordBox.getAll();
  }

  @override
  Future<void> updateSeenCount(String word, int newCount) async {
    final query = _learnedWordBox
        .query(LearnedWordDto_.word.equals(word))
        .build();
    final existingWord = query.findFirst();
    query.close();

    if (existingWord != null) {
      _learnedWordBox.put(existingWord.copyWith(seenCount: newCount));
    }
  }

  @override
  Future<void> updateExerciseCount(String word, int newCount) async {
    final query = _learnedWordBox
        .query(LearnedWordDto_.word.equals(word))
        .build();
    final existingWord = query.findFirst();
    query.close();

    if (existingWord != null) {
      _learnedWordBox.put(existingWord.copyWith(exerciseCount: newCount));
    }
  }

  @override
  Future<void> deleteWord(String word) async {
    final query = _learnedWordBox
        .query(LearnedWordDto_.word.equals(word))
        .build();
    final existingWord = query.findFirst();
    query.close();

    if (existingWord != null) {
      _learnedWordBox.remove(existingWord.id!);
    }
  }
}
