import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetCategoryWidget extends StatelessWidget {
  const PetCategoryWidget({
    super.key,
    required this.title,
    this.count = 0,
    required this.imagePath,
  });

  final String title;
  final int count;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          child: AspectRatio(
            aspectRatio: 1,
            child: Card(
              // color: colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(
                  imagePath,
                  colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            "${title.toUpperCase()}\n($count)",
            style: theme.textTheme.bodySmall!.copyWith(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
