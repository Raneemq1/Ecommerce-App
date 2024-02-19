import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(
      itemCount: shoppingCart.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final cart = shoppingCart[index];
        return Card(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cart.shoppingItem.productName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColors.orange.withOpacity(0.2)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        cart.status,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.orange, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CachedNetworkImage(
                      imageUrl: cart.shoppingItem.productImg,
                      height: 100,
                      fit: BoxFit.contain),
                  Text(
                    '${cart.totalPrice.toString()} \$',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16),
                  )
                ],
              )
            ],
          ),
        ));
      },
    ));
  }
}
/*
Text(cart.shoppingItem.productName),
                Text(cart.totalPrice.toString())
CachedNetworkImage(
              imageUrl: cart.shoppingItem.productImg,
            ),
             Text(cart.status)),
*/