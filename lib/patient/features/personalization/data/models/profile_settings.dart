import 'package:flutter/material.dart';

class ProfileSettingsModel {
  final Color leadingBackgroundColor;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileSettingsModel({
    required this.leadingBackgroundColor,
    required this.title,
    required this.icon,
    required this.onTap
  });
}
