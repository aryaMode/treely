import 'package:flutter/material.dart';
import 'package:treely/config/color_pallet.dart';
import 'package:treely/widgets/price.dart';

import '../models/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: kLightBrown,
          borderRadius: BorderRadius.all(
            Radius.circular(20 * 1.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: product.title!,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.network(
                    product.image!,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
            ),
            Text(
              product.title!,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              product.price != null ? "Plants" : "Ayurveda",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                product.price != null
                    ? Price(amount: product.price.toString())
                    : const SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
