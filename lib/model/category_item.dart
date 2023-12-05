import 'package:flutter/material.dart';

class Item {
  final String name;
  final IconData icon;

  const Item({
    required this.name,
    required this.icon,
  });
}

class IconModel {
  final IconData icon;

  IconModel({required this.icon});
}
