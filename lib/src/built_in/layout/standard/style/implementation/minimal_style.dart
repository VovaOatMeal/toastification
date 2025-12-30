import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/layout/standard/style/style.dart';
import 'package:toastification/src/utils/color_utils.dart';

class MinimalStandardToastStyle extends BaseStandardToastStyle {
  const MinimalStandardToastStyle({
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
      borderSide: const BorderSide(
        color: Color(0xffEBEBEB),
        width: 1.5,
      ),
    );
  }

  @override
  Color get iconColor => type.color;

  @override
  MaterialColor get primaryColor => type.color.toMaterialColor;

  @override
  Color get foregroundColor {
    final isDarkMode = flutterTheme?.brightness == Brightness.dark;
    return isDarkMode
        ? defaults.surfaceLight.toMaterialColor
        : defaults.surfaceDark;
  }

  @override
  Color get backgroundColor {
    final isDarkMode = flutterTheme?.brightness == Brightness.dark;
    return isDarkMode
        ? defaults.surfaceDark.toMaterialColor.shade800
        : defaults.surfaceLight;
  }

  @override
  BorderSide get borderSide {
    final isDarkMode = flutterTheme?.brightness == Brightness.dark;
    return isDarkMode
        ? super.borderSide.copyWith(color: backgroundColor)
        : super.borderSide;
  }
}
