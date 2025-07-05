import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_kids_app/src/core/config/logging_config.dart';
import 'package:the_kids_app/src/domain/errors/messages/error_messages.dart';
import 'package:the_kids_app/src/domain/usecases/learning_category/learning_category_usecase.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/categoty_selection_event.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/categoty_selection_state.dart';

@Injectable()
class CategorySelectionBloc
    extends Bloc<CategorySelectionEvent, CategorySelectionState> {
  final LearningCategoryUsecase _learningCategoryUsecase;

  CategorySelectionBloc(this._learningCategoryUsecase)
    : super(const Initial()) {
    on<Initialize>(_onInitialize);
  }

  Future<void> _onInitialize(
    CategorySelectionEvent event,
    Emitter<CategorySelectionState> emit,
  ) async {
    try {
      final learningCategoryList = await _learningCategoryUsecase.fetch();
      if (learningCategoryList.isEmpty) {
        emit(const InitialError(ErrorMessages.noLearningCategories));
      } else {
        emit(Loaded(learningCategories: learningCategoryList));
      }
    } on Exception catch (e) {
      AppLogger.e(e);
      emit(InitialError(ErrorMessages.unexpectedError));
    }
  }
}
