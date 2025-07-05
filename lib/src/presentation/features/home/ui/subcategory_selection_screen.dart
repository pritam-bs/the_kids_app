import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: subcategories.length,
          itemBuilder: (context, index) {
            final subcategory = subcategories[index];
            final subColor = cardColor.withValues(
              alpha: 0.9,
            );
            return CategoryCard(
              iconName:
                  subcategory.iconName,
              title: subcategory.nameEn,
              color: subColor,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Starting lessons for "${subcategory.nameEn}"!',
                    ),
                    backgroundColor: Colors.blue,
                  ),
                );
                // TODO: Implement actual navigation to learning content
              },
            );
          },
        ),
      ),
    );
  }
}
