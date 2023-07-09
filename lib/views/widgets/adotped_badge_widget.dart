import 'dart:math';

import 'package:flutter/material.dart';

class AdoptedBadgeWidget extends StatelessWidget {
  const AdoptedBadgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Transform.rotate(
      angle: -30 * (pi / 180),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.secondary,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "Adopted",
          style: theme.textTheme.bodyLarge!.copyWith(color: colorScheme.secondary, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
