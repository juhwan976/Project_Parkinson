import 'package:flutter/material.dart';

class ButtonData {
  ButtonData({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final Function onPressed;
}
