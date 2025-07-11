import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/domain/entities/learning_word/word_entity.dart';
import 'package:the_kids_app/src/presentation/features/learn_word/bloc/learn_word_bloc.dart';
import 'package:the_kids_app/src/presentation/features/learn_word/bloc/learn_word_event.dart';
import 'package:the_kids_app/src/presentation/features/learn_word/bloc/learn_word_state.dart';
import 'package:the_kids_app/src/presentation/features/learn_word/ui/flash_card_widget.dart';
import 'package:the_kids_app/src/presentation/widgets/initial_load_error_view_widget.dart';

@RoutePage()
class LearnWordScreen extends StatelessWidget implements AutoRouteWrapper {
  final String id;

  const LearnWordScreen({super.key, required this.id});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LearnWordBloc>()..add(Initialize(id)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learn Word!',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<LearnWordBloc, LearnWordState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              initialError: (message) => InitialLoadErrorView(
                message: message,
                onRetry: (context) {
                  context.read<LearnWordBloc>().add(
                    LearnWordEvent.initialize(id),
                  ); // Use Freezed event
                },
              ),
              loaded: (wordList, currentWordIndex, currentImageUrl) {
                if (wordList.isEmpty) {
                  return const Center(
                    child: Text('No words found for this category.'),
                  );
                }
                return _buildWordCard(
                  context,
                  wordList,
                  currentWordIndex,
                  currentImageUrl,
                  id, // Pass categoryId
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildWordCard(
    BuildContext context,
    List<WordEntity> wordList,
    int currentWordIndex,
    String? currentImageUrl,
    String categoryId,
  ) {
    // Ensure the PageController's initialPage is synchronized with the Bloc's state
    // This is important if the state changes (e.g., after an error and retry)
    final PageController pageController = PageController(
      initialPage: currentWordIndex,
    );

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: wordList.length,
            onPageChanged: (index) {
              // Dispatch ChangeWord event when page changes
              context.read<LearnWordBloc>().add(
                LearnWordEvent.changeWord(index),
              );
            },
            itemBuilder: (context, index) {
              final word = wordList[index];
              // Only pass imageUrl if it's for the currently displayed card
              final String? displayImageUrl = (index == currentWordIndex)
                  ? currentImageUrl
                  : null;
              return FlashCardWidget(
                word: word,
                categoryId: categoryId,
                imageUrl: displayImageUrl,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Previous Button
              ElevatedButton.icon(
                onPressed: currentWordIndex > 0
                    ? () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
              // Next Button
              ElevatedButton.icon(
                onPressed: currentWordIndex < wordList.length - 1
                    ? () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Next'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
