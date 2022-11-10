import 'package:flutter/material.dart';

/// TODO: 이미지 아이콘으로 변경하기.
enum EmotionType {
  happy(Icons.insert_emoticon_outlined);

  const EmotionType(this.icon);

  final IconData icon;
}
