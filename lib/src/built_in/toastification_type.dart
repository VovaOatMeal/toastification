import 'package:flutter/material.dart';
import 'package:toastification/src/utils/constants_values.dart';

/// Defines the visual and behavioral characteristics of built-in toast notifications.
/// This class is used by the [BuiltInBuilder] to style and render different types
/// of notifications with consistent appearance.
///
/// Each type comes with predefined:
/// - A unique name identifier
/// - A theme color that affects the toast's appearance
/// - An icon that represents the notification type
///
/// The package provides four built-in types:
/// - [info] - For general information messages (blue)
/// - [success] - For successful operations (green)
/// - [warning] - For warning messages (yellow/orange)
/// - [error] - For error messages (red)
///
/// Usage example with [Toastification.show]:
/// ```dart
/// toastification.show(
///   type: ToastificationType.success,
///   title: Text('Operation Successful'),
///   description: Text('Your changes have been saved'),
/// );
/// ```
///
/// You can also create custom types:
/// ```dart
/// final customType = ToastificationType.custom(
///   'custom',
///   Colors.purple,
///   Icons.star,
/// );
/// ```
class ToastificationType {
  /// The unique identifier name for this toast type
  final String name;

  /// The color associated with this toast type (used in light theme)
  final Color color;

  /// The color associated with this toast type in dark theme
  /// If null, the light theme color will be used
  final Color? darkColor;

  /// The icon to be displayed with this toast type
  final IconData icon;

  const ToastificationType._(this.name, this.color, this.icon,
      [this.darkColor]);

  /// Predefined information toast type with blue color scheme and info icon
  static const info = ToastificationType._(
      'info', infoColor, Icons.info_outline, infoDarkColor);

  /// Predefined success toast type with green color scheme and checkmark icon
  static const success = ToastificationType._('success', successColor,
      Icons.check_circle_outline_outlined, successDarkColor);

  /// Predefined warning toast type with yellow/orange color scheme and warning icon
  static const warning = ToastificationType._(
      'warning', warningColor, Icons.warning_amber, warningDarkColor);

  /// Predefined error toast type with red color scheme and close icon
  static const error = ToastificationType._(
      'error', errorColor, Icons.error_outline, errorDarkColor);

  /// Creates a custom toast type with specified name, color and icon.
  ///
  /// Use this constructor when the predefined toast types don't meet your needs.
  ///
  /// Parameters:
  ///   [name] - Unique identifier for the custom toast type
  ///   [color] - Custom color for the toast (light theme)
  ///   [icon] - Custom icon to be displayed
  ///   [darkColor] - Optional custom color for dark theme. If null, [color] will be used
  const factory ToastificationType.custom(
          String name, Color color, IconData icon, [Color? darkColor]) =
      ToastificationType._;

  /// Returns a list of all predefined toast types
  static List<ToastificationType> get defaultValues =>
      [info, success, warning, error];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToastificationType &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'ToastificationType.$name';
  }
}
