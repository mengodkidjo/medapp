import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadlineRow extends StatelessWidget {
  const HeadlineRow({super.key, required this.onPressed, required this.title});
  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            "View all",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
