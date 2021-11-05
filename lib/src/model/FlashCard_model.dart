import 'dart:html';

import 'package:flutter/material.dart';

class Flash_Card {
  final String name;
  final String spell;
  final String translation;
  final String example;
  final String image;
  late final String isFavoric;
  Flash_Card({
    required this.name,
    required this.spell,
    required this.translation,
    required this.example,
    required this.image,
    required this.isFavoric,
  });
}
