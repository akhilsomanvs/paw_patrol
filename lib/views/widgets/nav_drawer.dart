import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paw_patrol/style/bloc/theme_bloc.dart';
import 'package:paw_patrol/style/theme/app_themes.dart';
import 'package:paw_patrol/views/screens/history_screen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            BlocBuilder<ThemeBloc, ThemeData>(
              builder: (context, state) {
                final isDarkTheme = state == AppTheme.darkTheme;
                return ListTile(
                  leading: SvgPicture.asset(
                    isDarkTheme ? "assets/icons/ic_light_theme.svg" : "assets/icons/ic_dark_theme.svg",
                    height: 32,
                    width: 32,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                  ),
                  title: Text(isDarkTheme ? 'Light Theme' : 'Dark Theme'),
                  onTap: () {
                    BlocProvider.of<ThemeBloc>(context).add(ThemeSwitchEvent());
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Show History'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HistoryScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
