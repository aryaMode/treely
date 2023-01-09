import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopImages extends StatelessWidget {
  final String image, paragraph, heading;
  const TopImages({
    Key? key,
    required this.image, required this.paragraph, required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(
        //   height: 130,
        // ),
        Center(
          child: Image.asset(
            image,
            height: 320,
          ),
        ),
        const SizedBox(
          height: 66,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 34.0, right: 14),
          child: Text(
            heading,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            
          ),
        ),
        const SizedBox(
          height: 31,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 34.0, right: 14),
          child: Text(
            paragraph,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                letterSpacing: -0.408,
                height: 1.83,
                color: const Color.fromRGBO(0, 0, 0, 60)),
            textAlign: TextAlign.justify,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
