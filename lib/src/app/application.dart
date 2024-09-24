import 'package:flutter/material.dart' hide ThemeData, ThemeMode;

import 'navigation/navigation.dart';
import 'theme/theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        onGenerateRoute: onGenerateRoute,
        title: 'AnhuiWatch',
        theme: theme,
        darkTheme: darkTheme,
        themeMode: themeMode,
      );
}
