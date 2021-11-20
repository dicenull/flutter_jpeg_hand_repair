import 'package:flutter/material.dart';
import 'package:flutter_jpeg_hand_repair/pages/radio_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = neumorphicDefaultTheme;
    final darkTheme = neumorphicDefaultDarkTheme;
    final mode = ThemeMode.light;

    return NeumorphicTheme(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: mode,
      child: ProviderScope(
        child: MaterialApp(
          themeMode: mode,
          theme: _getMaterialTheme(theme),
          darkTheme: _getMaterialTheme(darkTheme),
          home: RadioPage(),
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
