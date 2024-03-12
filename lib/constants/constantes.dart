import 'package:flutter/material.dart';
import 'package:medapp/styles/app_color.dart';
import 'package:medapp/styles/images.dart';

class Constantes {
  static List<String> specialities = ["Cardiac", "Lungs", "Brain", "Dental"];
  static List<Color> specialitiesColors = [
    AppColor.cardiacColor,
    AppColor.lungColor,
    AppColor.brainColor,
    AppColor.dentalColor
  ];
  static List<String> specialitiesIcon = [
    Images.heart,
    Images.lungs,
    Images.brain,
    Images.tooth
  ];

  static List<String> schedules = [
    "Patient consultation",
    "Lunch Break",
    "Patient consultation",
    "Consultation Analysis"
  ];
  static List<String> times = [
    "10 AM - 12 PM",
    "01 AM - 02 PM",
    "02 AM - 04 PM",
    "04 AM - 06 PM"
  ];
  static List<String> status = ["Active", "Other", "Important", "Optional"];
  static List<IconData> statusIcon = [
    Icons.check,
    Icons.local_dining_rounded,
    Icons.star_border,
    Icons.monitor_heart_outlined
  ];
  static List<Color?> statusColors = [
    Colors.blue[400],
    Colors.green[900],
    Colors.yellow[700],
    Colors.greenAccent
  ];
}
