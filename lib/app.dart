import 'package:flutter_jpeg_hand_repair/pages/home_page.dart';
import 'package:flutter_jpeg_hand_repair/pages/radio_page.dart';
import 'package:flutter_jpeg_hand_repair/pages/slider_page.dart';
import 'package:flutter_jpeg_hand_repair/pages/switch_button_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = neumorphicDefaultTheme;
    final darkTheme = neumorphicDefaultDarkTheme;
    final mode = ThemeMode.light;

    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

    return NeumorphicTheme(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: mode,
      child: ProviderScope(
        child: MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          themeMode: mode,
          theme: _getMaterialTheme(theme),
          darkTheme: _getMaterialTheme(darkTheme),
        ),
      ),
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/stages/radio',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: RadioPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/stages/switch',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: SwitchPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: '/stages/slider',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: SliderPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
  ]);
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
