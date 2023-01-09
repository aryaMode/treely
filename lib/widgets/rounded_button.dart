import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treely/config/color_pallet.dart';

class RoundedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(16),
      height: 45,

      // margin: margin,
      width: size.width * 0.568,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 53),
            alignment: Alignment.center,
            color: kSecondaryColor,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kDarkBrown,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
