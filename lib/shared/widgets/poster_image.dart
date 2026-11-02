import 'dart:io';

import 'package:flutter/material.dart';

/// Poster or backdrop with a graceful placeholder.
///
/// Accepts an http(s) URL or a local file path. Network caching and TMDB image
/// URLs are added in Phase 4; this widget is the single place to change.
class PosterImage extends StatelessWidget {
  const PosterImage({
    super.key,
    required this.path,
    required this.title,
    this.fit = BoxFit.cover,
  });

  final String? path;
  final String title;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final value = path;
    if (value == null || value.isEmpty) return _Placeholder(title: title);

    final placeholder = _Placeholder(title: title);
    if (value.startsWith('http://') || value.startsWith('https://')) {
      return Image.network(
        value,
        fit: fit,
        errorBuilder: (context, error, stack) => placeholder,
        loadingBuilder: (context, child, progress) =>
            progress == null ? child : placeholder,
      );
    }
    return Image.file(
      File(value),
      fit: fit,
      errorBuilder: (context, error, stack) => placeholder,
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final trimmed = title.trim();
    final initial = trimmed.isEmpty ? '?' : trimmed.characters.first.toUpperCase();
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [scheme.primaryContainer, scheme.surfaceContainerHighest],
        ),
      ),
      child: Center(
        child: Text(
          initial,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: scheme.onPrimaryContainer,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
