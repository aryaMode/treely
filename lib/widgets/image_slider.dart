import 'package:flutter/material.dart';
import 'package:treely/config/color_pallet.dart';

class ImageIndexIndicator extends StatelessWidget {
  final int currentPage;
  final int length;

  const ImageIndexIndicator({
    Key? key,
    required this.currentPage,
    required this.length,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Dot(currentPage: currentPage, index: index),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
    required this.currentPage,
    required this.index,
  }) : super(key: key);

  final int currentPage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.all(9),
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        color: currentPage == index
            ? kDarkBrown
            : kLightBrown,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
