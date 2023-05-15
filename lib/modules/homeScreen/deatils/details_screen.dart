import 'package:flutter/material.dart';
import 'package:treely/config/color_pallet.dart';

import '../../../models/Product.dart';
import '../../../widgets/price.dart';
import 'components/cart_counter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key, required this.product, required this.onProductAdd})
      : super(key: key);

  final Product product;
  final Function onProductAdd;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _cartTag = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: widget.product.price != null
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget.onProductAdd();
                      setState(() {
                        _cartTag = '_cartTag';
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Add to Cart",
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
      backgroundColor: kTertiaryColor,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: kTertiaryColor,
                  child: Hero(
                    tag: widget.product.title! + _cartTag,
                    child: Image.network(widget.product.image!),
                  ),
                ),
                widget.product.price != null
                    ? const Positioned(
                        bottom: -20,
                        child: CartCounter(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
          const SizedBox(height: 20 * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                widget.product.price != null
                    ? Price(amount: widget.product.price.toString())
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.product.desc!,
              style: const TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      backgroundColor: kTertiaryColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.product.price != null ? "Plants" : "Ayurveda",
        style: const TextStyle(color: Colors.black),
      ),
      actions: const [
        SizedBox(width: 20),
      ],
    );
  }
}
