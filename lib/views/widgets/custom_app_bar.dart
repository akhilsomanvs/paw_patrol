import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paw_patrol/style/bloc/theme_bloc.dart';
import 'package:paw_patrol/style/bloc/theme_bloc.dart';
import 'package:paw_patrol/style/theme/app_themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Container(
        color: theme.colorScheme.background,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Hello, ", style: theme.textTheme.bodyLarge!.copyWith(fontSize: 22)),
                      Text("Joe", style: theme.textTheme.bodyLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text("Adopt a friend today", style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
