import 'package:flutter/material.dart';
import 'package:treely/config/color_pallet.dart';

class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "\₹ ",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w600, color: kDarkBrown),
        children: [
          TextSpan(
            text: amount,
            style: const TextStyle(color: Colors.black),
          ),
          // const TextSpan(
          //   text: "/k",
          //   style:
          //       TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
          // )
        ],
      ),
    );
  }
}
