import 'package:flutter/material.dart';

class InitialLoadErrorView extends StatelessWidget {
  final String? title;
  final String message;
  final void Function(BuildContext)? onRetry;
  final void Function(BuildContext)? onClose;

  const InitialLoadErrorView({
    super.key,
    this.title,
    required this.message,
    this.onRetry,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_off,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 24),
              if (title != null) ...[
                Text(title!, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 16),
              ],
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (onClose != null)
                    OutlinedButton(
                      onPressed: () => onClose!(context),
                      child: const Text('Close'),
                    ),
                  if (onClose != null && onRetry != null)
                    const SizedBox(width: 16),
                  if (onRetry != null)
                    FilledButton(
                      onPressed: () => onRetry!(context),
                      child: const Text('Try Again'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
