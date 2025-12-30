import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/layout/standard/style/style.dart';
import 'package:toastification/src/utils/color_utils.dart';

class FlatStandardColoredToastStyle extends BaseStandardToastStyle {
  const FlatStandardColoredToastStyle({
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
  Color get foregroundColor {
    final isDarkMode = flutterTheme?.brightness == Brightness.dark;
    return isDarkMode
        ? defaults.surfaceLight.withValues(alpha: 0.8)
        : providedValues?.surfaceDark ?? defaults.surfaceDark;
  }

  @override
  Color get backgroundColor {
    final isDarkMode = flutterTheme?.brightness == Brightness.dark;
    final blendForegroundColor = primaryColor.withValues(alpha: 0.5);
    final blendBackgroundColor = defaults.surfaceDark;
    final blendForDarkMode =
        Color.alphaBlend(blendForegroundColor, blendBackgroundColor);
    return isDarkMode ? blendForDarkMode : primaryColor.shade100;
  }

  @override
  Color get iconColor => foregroundColor;

  @override
  BorderSide get borderSide =>
      providedValues?.borderSide ??
      BorderSide(
        color: primaryColor,
        width: 1.5,
      );
}
