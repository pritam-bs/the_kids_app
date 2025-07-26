import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/data/datasources/exercise_store/exercise_store_datasource.dart';
import 'package:the_kids_app/src/data/datasources/learned_word/learned_word_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_inference/inference_data_source.dart';
import 'package:the_kids_app/src/data/datasources/llm_model/mdel_data_source.dart';
import 'package:the_kids_app/src/data/exercise_generator/exercise_generator.dart';

@module
abstract class ExerciseGeneratorModule {
  @singleton
  ExerciseGenerator getExerciseGenerator(
    LearnedWordDataSource learnedWordDataSource,
    ExerciseStoreDatasource exerciseStoreDatasource,
    ModelDataSource modelDataSource,
    InferenceDataSource inferenceDataSource,
  ) {
    final exerciseGenerator = ExerciseGenerator(
      learnedWordDataSource,
      exerciseStoreDatasource,
      modelDataSource,
      inferenceDataSource,
    );

    exerciseGenerator.initialize();

    return exerciseGenerator;
  }
}
