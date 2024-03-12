import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogItem extends StatelessWidget {
  const BlogItem(
      {super.key,
      required this.url,
      required this.title,
      required this.time,
      required this.notation});
  final String url;
  final String title;
  final String time;
  final double notation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey[400],
                        ),
                        label: Text(
                          time,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        color: Colors.grey[400],
                        width: 5,
                        endIndent: 2,
                      ),
                    ),
                    TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.star_border,
                          color: Colors.yellow[400],
                        ),
                        label: Text(
                          "$notation",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
