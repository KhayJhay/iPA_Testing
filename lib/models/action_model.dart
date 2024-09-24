import 'package:flutter/material.dart';

class ActionModel {
  final String name;
  final String description;
  IconData icons;
  ActionModel(
      {required this.name, required this.description, this.icons = Icons.abc});
}
