import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medapp/constants/constantes.dart';
import 'package:medapp/styles/vertical_space.dart';

class CategorieWidget extends StatelessWidget {
  const CategorieWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Constantes.specialitiesColors.elementAt(index),
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Constantes.specialitiesIcon.elementAt(index),
            width: 32,
            color: Colors.white,
          ),
          VerticalSpace.vSpace8,
          Text(
            Constantes.specialities.elementAt(index),
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
