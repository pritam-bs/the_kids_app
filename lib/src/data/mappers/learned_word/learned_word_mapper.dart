import 'package:the_kids_app/src/data/dtos/learned_word/learned_word_dto.dart';
import 'package:the_kids_app/src/domain/entities/learned_word/learned_word_entity.dart';

extension LearnedWordDtoMapper on LearnedWordDto {
  LearnedWordEntity toEntity() => LearnedWordEntity(
    id: id,
    word: word,
    category: category,
    seenCount: seenCount,
    exerciseCount: exerciseCount,
  );
}


extension LearnedWordEntityMapper on LearnedWordEntity {
  LearnedWordDto toDto() => LearnedWordDto(
    word: word,
    category: category,
    seenCount: seenCount,
    exerciseCount: exerciseCount,
  );
}
