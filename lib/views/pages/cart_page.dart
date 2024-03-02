import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/cart/cart_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/cart/cart_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getData(),
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<CartCubit>(context);
        return BlocBuilder<CartCubit, CartStatus>(
          bloc: cubit,
          buildWhen: (previous, current) =>
              current is CartLoading ||
              current is CartLoaded ||
              current is CartError,
          builder: (context, state) {
            debugPrint('CartPage ${state.toString()}');
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is CartLoaded) {
              final products = state.products;
              final shoppingCartItems = state.shoppingItems;
              debugPrint(
                  'CartPage ${shoppingCartItems.isEmpty.toString()} orders');
              return shoppingCartItems.isEmpty
                  ? const Center(
                      child: Text('no added items yet'),
                    )
                  : SingleChildScrollView(
                      child: ListView.builder(
                      itemCount: shoppingCartItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final cart = shoppingCartItems[index];

                        var product = products
                            .where(
                              (element) => element.productId == cart.productId,
                            )
                            .first;

                        return Card(
                            child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.productName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontSize: 16),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: AppColors.orange
                                                .withOpacity(0.2)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            cart.status,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    color: AppColors.orange,
                                                    fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            //remove from carts
                                            cubit.deleteOrder(cart.id);
                                          },
                                          child: Icon(Icons.delete)),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 0.5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CachedNetworkImage(
                                      imageUrl: product.productImg,
                                      height: 80,
                                      fit: BoxFit.cover),
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
            } else {
              return const SizedBox();
            }
          },
        );
      }),
    );
  }
}
