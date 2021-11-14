import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/widgets/radio_button_list.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = neumorphicDefaultTheme;
    final darkTheme = neumorphicDefaultDarkTheme;
    final mode = ThemeMode.light;

    return NeumorphicTheme(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: mode,
      child: MaterialApp(
        themeMode: mode,
        theme: _getMaterialTheme(theme),
        darkTheme: _getMaterialTheme(darkTheme),
        home: Scaffold(
          appBar: NeumorphicAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                RadioButtonList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// https://github.com/Idean/Flutter-Neumorphic/blob/master/lib/src/widget/app.dart
ThemeData _getMaterialTheme(NeumorphicThemeData theme) {
  final color = theme.accentColor;

  if (color is MaterialColor) {
    return ThemeData(
      primarySwatch: color,
      textTheme: theme.textTheme,
      iconTheme: theme.iconTheme,
      scaffoldBackgroundColor: theme.baseColor,
    );
  }

  return ThemeData(
    primaryColor: theme.accentColor,
    accentColor: theme.variantColor,
    iconTheme: theme.iconTheme,
    brightness: ThemeData.estimateBrightnessForColor(theme.baseColor),
    primaryColorBrightness:
        ThemeData.estimateBrightnessForColor(theme.accentColor),
    accentColorBrightness:
        ThemeData.estimateBrightnessForColor(theme.variantColor),
    textTheme: theme.textTheme,
    scaffoldBackgroundColor: theme.baseColor,
  );
}
