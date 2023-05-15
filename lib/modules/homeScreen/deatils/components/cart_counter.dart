import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'rounded_icon_btn.dart';

final cartNumProvider = StateProvider<int?>((ref) => 1);

class CartCounter extends ConsumerStatefulWidget {
  const CartCounter({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends ConsumerState<CartCounter> {
  @override
  Widget build(BuildContext context) {
    final cartNum = ref.watch(cartNumProvider) ?? 1;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            color: Colors.black38,
            press: () {
              if (cartNum > 1) {
                setState(() {
                  ref
                      .read(cartNumProvider.notifier)
                      .update((state) => state! - 1);
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20 / 4),
            child: Text(
              cartNum.toString(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {
              setState(() {
                ref
                    .read(cartNumProvider.notifier)
                    .update((state) => state! + 1);
              });
            },
          ),
        ],
      ),
    );
  }
}
