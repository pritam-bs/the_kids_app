import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_kids_app/src/core/di/injection.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart';
import 'package:the_kids_app/src/presentation/colors/kids_colors.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/categoty_selection_bloc.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/categoty_selection_event.dart';
import 'package:the_kids_app/src/presentation/features/home/bloc/categoty_selection_state.dart';
import 'package:the_kids_app/src/presentation/features/home/ui/category_card.dart';
import 'package:the_kids_app/src/presentation/widgets/initial_error/initial_load_error_view_widget.dart';

@RoutePage()
class CategorySelectionScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const CategorySelectionScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategorySelectionBloc>()..add(Initialize()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '👋 Hallo!',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.school,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  AutoRouter.of(context).push(ExerciseHomeRoute());
                },
                tooltip: 'Go to Exercises & Stories',
              ),
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CategorySelectionBloc, CategorySelectionState>(
          builder: (context, state) {
            if (state is InitialError) {
              return InitialLoadErrorView(
                message: state.message,
                onRetry: (context) {
                  context.read<CategorySelectionBloc>().add(Initialize());
                },
              );
            }

            if (state is Loaded) {
              final categories = state.learningCategories;
              return _buildCategoryGrid(categories);
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(List<LearningCategoryEntity> categories) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final color = KidsColors.getRandomKidFriendlyColor();
        return CategoryCard(
          iconName: category.iconName,
          title: category.nameEn,
          color: color,
          onTap: () {
            final subcategories = category.subcategories;
            if (subcategories.isNotEmpty) {
              // Navigate to subcategory selection screen if subcategories exist
              AutoRouter.of(context).push(
                SubcategorySelectionRoute(
                  title: category.nameEn,
                  subcategories: subcategories,
                  cardColor: color,
                ),
              );
            } else {
              AutoRouter.of(context).push(LearnWordRoute(id: category.id));
            }
          },
        );
      },
    );
  }
}
