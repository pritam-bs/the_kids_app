import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';
import 'package:the_kids_app/src/domain/entities/learning_category/learning_category_entity.dart';
import 'package:the_kids_app/src/presentation/features/home/ui/category_card.dart';

@RoutePage()
class SubcategorySelectionScreen extends StatelessWidget {
  final String title;
  final List<LearningCategoryEntity> subcategories;
  final Color cardColor;

  const SubcategorySelectionScreen({
    super.key,
    required this.title,
    required this.subcategories,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.0,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: subcategories.length,
          itemBuilder: (context, index) {
            final subcategory = subcategories[index];
            final subColor = cardColor.withValues(alpha: 0.9);
            return CategoryCard(
              iconName: subcategory.iconName,
              title: subcategory.nameEn,
              color: subColor,
              onTap: () {
                AutoRouter.of(context).push(LearnWordRoute(id: subcategory.id));
              },
            );
          },
        ),
      ),
    );
  }
}
