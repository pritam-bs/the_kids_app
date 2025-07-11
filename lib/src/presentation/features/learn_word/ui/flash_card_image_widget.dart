import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlashCardImage extends StatelessWidget {
  final String? imageUrl; // Now directly receives the URL
  final double responsiveImageHeight;

  const FlashCardImage({
    super.key,
    required this.imageUrl, // Changed to non-Future
    required this.responsiveImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: responsiveImageHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.scaleDown,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: colorScheme.primary),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    size: responsiveImageHeight * 0.4,
                    color: colorScheme.error,
                  ),
                ),
              )
            : Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: responsiveImageHeight * 0.4,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
      ),
    );
  }
}
