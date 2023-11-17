// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RoleContainerWidget extends StatelessWidget {
  String? headerTitle1;
  String? headerTitle2;
  String detail;
  String detail2;
  String? detail3;
  String? detail4;
  String? detail5;
  String? detail6;
  Color? color1;
  Color? color2;
  Color? color3;
  Color? color4;
  Color? color5;
  Color? color6;
  IconData? icon1;
  IconData? icon2;
  IconData? icon3;
  IconData? icon4;
  IconData? icon5;
  IconData? icon6;
  RoleContainerWidget({
    Key? key,
    this.headerTitle1,
    this.headerTitle2,
    required this.detail,
    required this.detail2,
    this.detail3,
    this.detail4,
    this.detail5,
    this.detail6,
    this.icon1,
    this.icon2,
    this.icon3,
    this.icon4,
    this.icon5,
    this.icon6,
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.color5,
    this.color6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerTitle1!,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Icon(
                icon1,
                color: color1,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                detail,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Icon(
                icon1,
                color: color1,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                detail2,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Icon(
                icon3,
                color: color3,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                detail3!,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            headerTitle2!,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                icon4,
                color: color4,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                detail4!,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Icon(
                icon5,
                color: color5,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                detail5!,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Icon(
                icon6,
                color: color6,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                detail6!,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
