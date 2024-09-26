import 'package:flutter/material.dart';

ThemeData get theme => ThemeData();

ThemeData get darkTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        brightness: Brightness.dark,
      ),
    );

ThemeMode get themeMode => ThemeMode.system;
