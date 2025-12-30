import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/layout/standard/style/style.dart';
import 'package:toastification/src/utils/color_utils.dart';

class FilledStandardToastStyle extends BaseStandardToastStyle {
  const FilledStandardToastStyle({
    required super.type,
    super.providedValues,
    super.flutterTheme,
  });

  @override
  DefaultStyleValues get defaults {
    final isDarkMode = flutterTheme?.brightness == Brightness.dark;
    final effectiveColor =
        isDarkMode && type.darkColor != null ? type.darkColor! : type.color;
    return DefaultStyleValues(
      primaryColor: effectiveColor.toMaterialColor,
      surfaceLight: Colors.white,
      surfaceDark: Colors.black,
    );
  }

  @override
  Color get backgroundColor => primaryColor;

  @override
  Color get foregroundColor {
    final bg = backgroundColor;
    final luminance = bg.computeLuminance();
    // Typical threshold for deciding light vs dark foreground
    if (luminance > 0.5) {
      return providedValues?.surfaceDark ?? defaults.surfaceDark;
    } else {
      return providedValues?.surfaceLight ?? defaults.surfaceLight;
    }
  }

  @override
  Color blurredBackgroundColor(bool applyBlur, Color color) =>
      applyBlur ? color.withValues(alpha: 0.8) : color;

  @override
  Color get iconColor => foregroundColor;

  @override
  ProgressIndicatorThemeData get defaultProgressIndicatorTheme =>
      ProgressIndicatorThemeData(
        color: foregroundColor.withValues(alpha: .30),
        linearMinHeight: progressIndicatorStrokeWidth,
        linearTrackColor: foregroundColor.withValues(alpha: .15),
        refreshBackgroundColor: foregroundColor.withValues(alpha: .15),
      );
}
