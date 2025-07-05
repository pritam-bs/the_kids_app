import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconName; // Use iconName to load the image
  final String title;
  final VoidCallback onTap;
  final Color color; // This color will now be used for the text background

  const CategoryCard({
    super.key,
    required this.iconName,
    required this.title,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Construct the image path based on the iconName
    final String imagePath =
        'assets/category_subcategory_imgs/$iconName.jpg'; // Assuming .png

    return Card(
      color: Colors.transparent,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.white.withValues(alpha: 0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // Image takes most of the space
              flex: 5,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: color.withValues(alpha: 0.9),
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_rounded,
                        size: 60,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: color.withValues(alpha: 0.9),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 4.0,
                ),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
