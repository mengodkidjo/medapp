import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medapp/constants/constantes.dart';
import 'package:medapp/styles/horizontal_space.dart';

class EventWidget extends StatelessWidget {
  const EventWidget(
      {super.key,
      required this.title,
      required this.status,
      required this.time,
      required this.index});
  final String title;
  final String status;
  final String time;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              TextButton.icon(
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Constantes.statusColors.elementAt(index)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 12.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)))),
                  icon: Icon(
                    Constantes.statusIcon.elementAt(index),
                    color: Colors.white,
                    size: 14.0,
                  ),
                  label: Text(
                    status,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: Colors.grey[500],
                size: 14.0,
              ),
              HorizontalSpace.hSpace8,
              Text(
                time,
                style: GoogleFonts.montserrat(
                    color: Colors.grey[500], fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
