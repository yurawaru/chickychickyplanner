import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff7a590c),
      surfaceTint: Color(0xff7a590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdea7),
      onPrimaryContainer: Color(0xff271900),
      secondary: Color(0xff6d5c3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff7dfbb),
      onSecondaryContainer: Color(0xff251a04),
      tertiary: Color(0xff4c6544),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffceebc1),
      onTertiaryContainer: Color(0xff0a2007),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f3),
      onBackground: Color(0xff201b13),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff201b13),
      surfaceVariant: Color(0xffeee1cf),
      onSurfaceVariant: Color(0xff4e4639),
      outline: Color(0xff807667),
      outlineVariant: Color(0xffd1c5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inverseOnSurface: Color(0xfffaefe2),
      inversePrimary: Color(0xffedc06c),
      primaryFixed: Color(0xffffdea7),
      onPrimaryFixed: Color(0xff271900),
      primaryFixedDim: Color(0xffedc06c),
      onPrimaryFixedVariant: Color(0xff5e4200),
      secondaryFixed: Color(0xfff7dfbb),
      onSecondaryFixed: Color(0xff251a04),
      secondaryFixedDim: Color(0xffdac4a0),
      onSecondaryFixedVariant: Color(0xff54452a),
      tertiaryFixed: Color(0xffceebc1),
      onTertiaryFixed: Color(0xff0a2007),
      tertiaryFixedDim: Color(0xffb3cea7),
      onTertiaryFixedVariant: Color(0xff354d2e),
      surfaceDim: Color(0xffe3d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff7ecdf),
      surfaceContainerHigh: Color(0xfff1e7d9),
      surfaceContainerHighest: Color(0xffece1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff593e00),
      surfaceTint: Color(0xff7a590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff936e23),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4f4126),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff847254),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff32492b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff627b59),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f3),
      onBackground: Color(0xff201b13),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff201b13),
      surfaceVariant: Color(0xffeee1cf),
      onSurfaceVariant: Color(0xff4a4235),
      outline: Color(0xff675e50),
      outlineVariant: Color(0xff83796b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inverseOnSurface: Color(0xfffaefe2),
      inversePrimary: Color(0xffedc06c),
      primaryFixed: Color(0xff936e23),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff785609),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff847254),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6a5a3d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff627b59),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4a6242),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe3d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff7ecdf),
      surfaceContainerHigh: Color(0xfff1e7d9),
      surfaceContainerHighest: Color(0xffece1d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff2f1f00),
      surfaceTint: Color(0xff7a590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff593e00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2c2009),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4f4126),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff11270c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff32492b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f3),
      onBackground: Color(0xff201b13),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffeee1cf),
      onSurfaceVariant: Color(0xff2a2318),
      outline: Color(0xff4a4235),
      outlineVariant: Color(0xff4a4235),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe9c8),
      primaryFixed: Color(0xff593e00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3d2900),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4f4126),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff382b12),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff32492b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1c3216),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe3d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff7ecdf),
      surfaceContainerHigh: Color(0xfff1e7d9),
      surfaceContainerHighest: Color(0xffece1d4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffedc06c),
      surfaceTint: Color(0xffedc06c),
      onPrimary: Color(0xff412d00),
      primaryContainer: Color(0xff5e4200),
      onPrimaryContainer: Color(0xffffdea7),
      secondary: Color(0xffdac4a0),
      onSecondary: Color(0xff3c2e15),
      secondaryContainer: Color(0xff54452a),
      onSecondaryContainer: Color(0xfff7dfbb),
      tertiary: Color(0xffb3cea7),
      onTertiary: Color(0xff1f361a),
      tertiaryContainer: Color(0xff354d2e),
      onTertiaryContainer: Color(0xffceebc1),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff17130b),
      onBackground: Color(0xffece1d4),
      surface: Color(0xff17130b),
      onSurface: Color(0xffece1d4),
      surfaceVariant: Color(0xff4e4639),
      onSurfaceVariant: Color(0xffd1c5b4),
      outline: Color(0xff9a8f80),
      outlineVariant: Color(0xff4e4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inverseOnSurface: Color(0xff353027),
      inversePrimary: Color(0xff7a590c),
      primaryFixed: Color(0xffffdea7),
      onPrimaryFixed: Color(0xff271900),
      primaryFixedDim: Color(0xffedc06c),
      onPrimaryFixedVariant: Color(0xff5e4200),
      secondaryFixed: Color(0xfff7dfbb),
      onSecondaryFixed: Color(0xff251a04),
      secondaryFixedDim: Color(0xffdac4a0),
      onSecondaryFixedVariant: Color(0xff54452a),
      tertiaryFixed: Color(0xffceebc1),
      onTertiaryFixed: Color(0xff0a2007),
      tertiaryFixedDim: Color(0xffb3cea7),
      onTertiaryFixedVariant: Color(0xff354d2e),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e382f),
      surfaceContainerLowest: Color(0xff120e07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff2c470),
      surfaceTint: Color(0xffedc06c),
      onPrimary: Color(0xff201400),
      primaryContainer: Color(0xffb28a3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffdec8a4),
      onSecondary: Color(0xff1f1401),
      secondaryContainer: Color(0xffa28e6e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb7d3ab),
      onTertiary: Color(0xff061b03),
      tertiaryContainer: Color(0xff7e9873),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff17130b),
      onBackground: Color(0xffece1d4),
      surface: Color(0xff17130b),
      onSurface: Color(0xfffffaf7),
      surfaceVariant: Color(0xff4e4639),
      onSurfaceVariant: Color(0xffd6c9b8),
      outline: Color(0xffada191),
      outlineVariant: Color(0xff8c8273),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inverseOnSurface: Color(0xff2f2921),
      inversePrimary: Color(0xff5f4300),
      primaryFixed: Color(0xffffdea7),
      onPrimaryFixed: Color(0xff1a0f00),
      primaryFixedDim: Color(0xffedc06c),
      onPrimaryFixedVariant: Color(0xff493200),
      secondaryFixed: Color(0xfff7dfbb),
      onSecondaryFixed: Color(0xff1a0f00),
      secondaryFixedDim: Color(0xffdac4a0),
      onSecondaryFixedVariant: Color(0xff42341b),
      tertiaryFixed: Color(0xffceebc1),
      onTertiaryFixed: Color(0xff021501),
      tertiaryFixedDim: Color(0xffb3cea7),
      onTertiaryFixedVariant: Color(0xff253c1f),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e382f),
      surfaceContainerLowest: Color(0xff120e07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf7),
      surfaceTint: Color(0xffedc06c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfff2c470),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffdec8a4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff2ffe7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb7d3ab),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff17130b),
      onBackground: Color(0xffece1d4),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff4e4639),
      onSurfaceVariant: Color(0xfffffaf7),
      outline: Color(0xffd6c9b8),
      outlineVariant: Color(0xffd6c9b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff392700),
      primaryFixed: Color(0xffffe3b6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff2c470),
      onPrimaryFixedVariant: Color(0xff201400),
      secondaryFixed: Color(0xfffbe4bf),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffdec8a4),
      onSecondaryFixedVariant: Color(0xff1f1401),
      tertiaryFixed: Color(0xffd3efc5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb7d3ab),
      onTertiaryFixedVariant: Color(0xff061b03),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e382f),
      surfaceContainerLowest: Color(0xff120e07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
