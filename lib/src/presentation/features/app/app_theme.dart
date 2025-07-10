import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

final FlexSchemeData kidsAppScheme = FlexSchemeData(
  name: 'KidsApp Fun',
  description: 'A vibrant and cheerful theme for kids applications.',
  // Light Theme Colors
  light: FlexSchemeColor(
    primary: const Color(
      0xFF4CAF50,
    ), // Bright Green (e.g., for positive feedback)
    primaryContainer: const Color(0xFFC8E6C9),
    secondary: const Color(
      0xFFFFC107,
    ), // Sunny Yellow (e.g., for accents, warnings)
    secondaryContainer: const Color(0xFFFFECB3),
    tertiary: const Color(
      0xFF2196F3,
    ), // Playful Blue (e.g., for buttons, links)
    tertiaryContainer: const Color(0xFFBBDEFB),
    appBarColor: const Color(0xFF4CAF50), // App bar matches primary
    error: const Color(0xFFB00020), // Standard Material light error red
    errorContainer: const Color(0xFFFFDAD6), // A light, muted red for container
  ),
  // Dark Theme Colors
  dark: FlexSchemeColor(
    primary: const Color(0xFF81C784), // Softer green for dark mode
    primaryContainer: const Color(0xFF2E7D32),
    secondary: const Color(0xFFFFD54F), // Softer yellow for dark mode
    secondaryContainer: const Color(0xFFFFB300),
    tertiary: const Color(0xFF64B5F6), // Softer blue for dark mode
    tertiaryContainer: const Color(0xFF1976D2),
    appBarColor: const Color(0xFF388E3C), // Darker green app bar
    error: const Color(0xFFCF6679), // Standard Material dark error red
    errorContainer: const Color(
      0xFF690005,
    ), // A darker, muted red for container
  ),
);

/// Creates a consistent TextTheme for the app.
/// FlexColorScheme will automatically apply the appropriate colors (like onPrimary, onSurface)
/// based on where the text is used in the UI.
TextTheme _buildTextTheme(ThemeData baseTheme) {
  // Use baseTheme.textTheme to get the default Material 3 text styles
  // and then copyWith to override specific properties.
  // The font family is already set by FlexColorScheme.
  return baseTheme.textTheme.copyWith(
    // Display styles (very large, prominent text for splash screens, huge headings)
    displayLarge: baseTheme.textTheme.displayLarge?.copyWith(
      fontSize: 64.0,
      fontWeight: FontWeight.w900, // Extra bold
    ),
    displayMedium: baseTheme.textTheme.displayMedium?.copyWith(
      fontSize: 48.0,
      fontWeight: FontWeight.w800, // Very bold
    ),
    displaySmall: baseTheme.textTheme.displaySmall?.copyWith(
      fontSize: 36.0,
      fontWeight: FontWeight.w700, // Bold
    ),

    // Headline styles (major section headings, important announcements)
    headlineLarge: baseTheme.textTheme.headlineLarge?.copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w700, // Bold
    ),
    headlineMedium: baseTheme.textTheme.headlineMedium?.copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.w700, // Bold
    ),
    headlineSmall: baseTheme.textTheme.headlineSmall?.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w700, // Bold (matches your AppBar title)
    ),

    // Title styles (sub-headings, card titles, dialog titles)
    titleLarge: baseTheme.textTheme.titleLarge?.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w600, // Semi-bold
    ),
    titleMedium: baseTheme.textTheme.titleMedium?.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600, // Semi-bold
    ),
    titleSmall: baseTheme.textTheme.titleSmall?.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500, // Medium
    ),

    // Body styles (main text content, paragraphs)
    bodyLarge: baseTheme.textTheme.bodyLarge?.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400, // Regular
    ),
    bodyMedium: baseTheme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400, // Regular
    ),
    bodySmall: baseTheme.textTheme.bodySmall?.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400, // Regular
    ),

    // Label styles (small text, captions, button labels, chip text)
    labelLarge: baseTheme.textTheme.labelLarge?.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500, // Medium (good for buttons)
    ),
    labelMedium: baseTheme.textTheme.labelMedium?.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500, // Medium
    ),
    labelSmall: baseTheme.textTheme.labelSmall?.copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.w500, // Medium
    ),
  );
}

/// Provides the light [ThemeData] for the app using [kidsAppScheme].
ThemeData lightTheme() {
  final baseTheme = FlexThemeData.light(
    colors: kidsAppScheme.light,
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    blendLevel: 5, // A subtle blend for clarity
    appBarElevation: 0.5,
    subThemesData: const FlexSubThemesData(
      buttonMinSize: Size(48, 48), // Larger tap targets for kids
      textButtonRadius: 8.0,
      filledButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      toggleButtonsRadius: 8.0,
      inputDecoratorRadius: 8.0,
      cardRadius: 20.0,
      chipRadius: 8.0,
      dialogRadius: 20.0,
      snackBarRadius: 8.0,
      tooltipRadius: 8.0,
      fabUseShape: true,
      fabAlwaysCircular: true,
    ),
    // Specify the font family here. FlexColorScheme will apply it to the base TextTheme.
    fontFamily: 'Inter',
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  );
  // Apply custom TextTheme after FlexColorScheme has set its defaults,
  // ensuring proper color application.
  return baseTheme.copyWith(textTheme: _buildTextTheme(baseTheme));
}

/// Provides the dark [ThemeData] for the app using [kidsAppScheme].
ThemeData darkTheme() {
  final baseTheme = FlexThemeData.dark(
    colors: kidsAppScheme.dark,
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    blendLevel: 5,
    appBarElevation: 0.5,
    subThemesData: const FlexSubThemesData(
      buttonMinSize: Size(48, 48), // Larger tap targets for kids
      textButtonRadius: 8.0,
      filledButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      toggleButtonsRadius: 8.0,
      inputDecoratorRadius: 8.0,
      cardRadius: 20.0,
      chipRadius: 8.0,
      dialogRadius: 20.0,
      snackBarRadius: 8.0,
      tooltipRadius: 8.0,
      fabUseShape: true,
      fabAlwaysCircular: true,
    ),
    // Specify the font family here. FlexColorScheme will apply it to the base TextTheme.
    fontFamily: 'Inter',
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  );
  // Apply custom TextTheme after FlexColorScheme has set its defaults,
  // ensuring proper color application.
  return baseTheme.copyWith(textTheme: _buildTextTheme(baseTheme));
}
