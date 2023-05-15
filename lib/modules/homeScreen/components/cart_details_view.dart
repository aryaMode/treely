import 'package:flutter/material.dart';

import '../../../config/color_pallet.dart';
import '../../../controllers/home_controller.dart';
import 'cart_detailsview_card.dart';

class CartDetailsView extends StatelessWidget {
  CartDetailsView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  int cartTotal = 0;

  int getCartTotal() {
    print(controller.cart.length);
    controller.cart.forEach((product) {
      print(product.product?.price);
      int? a = product.product?.price;
      cartTotal += (product.quantity) * (a ?? 0);
    });
    return cartTotal;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cart", style: Theme.of(context).textTheme.titleLarge),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailsViewCard(productItem: controller.cart[index]),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text("Next - ₹ ${getCartTotal()}"),
            ),
          )
        ],
      ),
    );
  }
}
