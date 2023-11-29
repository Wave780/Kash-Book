import 'package:flutter/material.dart';

class Item {
  
  final String name;
  final IconData icon;

  Item( {
    
    required this.name,
    required this.icon,
  });

 

  Item copyWith({
    
    String? name,
    IconData? icon,
  }) {
    return Item(
     
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }
}
