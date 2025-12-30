import 'package:flutter/material.dart';

const infoColor = Color(0xFF47AFFF);

/// default color for success toastification
const successColor = Color(0xFF32BC32);

/// default color for warning toastification
const warningColor = Color(0xFFFFB600);

/// default color for error toastification
const errorColor = Color(0xFFFF3A30);

// Dark theme color constants
const infoDarkColor = Color(0xFF002846);
const successDarkColor = Color(0xFF0B290B);
const warningDarkColor = Color(0xFF372700);
const errorDarkColor = Color(0xFF400300);

const lowModeShadow = [
  BoxShadow(
    color: Color(0x07000000),
    blurRadius: 16,
    offset: Offset(0, 16),
    spreadRadius: 0,
  ),
];

const highModeShadow = [
  BoxShadow(
    color: Color(0x14000000),
    blurRadius: 30,
    offset: Offset(0, 20),
    spreadRadius: 0,
  ),
];
