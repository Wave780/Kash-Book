import 'package:flutter/material.dart';

class Item {
  final int? id;
  final String name;
  final IconData icon;

  const Item( {this.id,
    required this.name,
    required this.icon,
  });
}

class IconModel {
  final IconData icon;

  IconModel({required this.icon});
}
