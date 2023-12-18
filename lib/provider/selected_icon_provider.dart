import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final iconProvider = StateProvider<IconData?>((ref) => null);

const icons = [
  FontAwesomeIcons.dailymotion,
  FontAwesomeIcons.cableCar,
  FontAwesomeIcons.wallet,
  FontAwesomeIcons.calculator,
  FontAwesomeIcons.tableCells,
  FontAwesomeIcons.radio,
  FontAwesomeIcons.faceGrin,
  FontAwesomeIcons.yahoo,
  FontAwesomeIcons.youtube,
  FontAwesomeIcons.twitter,
  FontAwesomeIcons.facebook,
];


