import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/checkout/checkout_status.dart';
import 'package:ecommerce_app/viewmodel/cubit/checkout/chekout_cubit.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  late double totalPrice;
  PaymentPage({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    void print() {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Shipped Successfully")));
    }

    return BlocProvider(
      create: (context) {
        final cubit = CheckoutCubit();
        cubit.uploadData();
        return cubit;
      },
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<CheckoutCubit>(context);
        return BlocBuilder<CheckoutCubit, CheckoutStatus>(
          bloc: cubit,
          buildWhen: (previous, current) =>
              current is CheckoutLoading ||
              current is CheckoutSucess ||
              current is CheckoutError,
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is CheckoutSucess) {
              String address = state.address;
              List<Cart> shoppingItems = state.shoppingItems;
              List<Product> products = state.products;
              return Scaffold(
                  appBar: AppBar(),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "https://developers.google.com/static/codelabs/maps-platform/maps-platform-101-js/img/e52623cb8578d625.png",
                              height: 80,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(address,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 16)),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Products(${shoppingItems.length.toString()})",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              itemCount: shoppingItems.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final shoppingItem = shoppingItems[index];
                                final product = products
                                    .where((product) =>
                                        product.productId ==
                                        shoppingItem.productId)
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
                                          Row(
                                            children: [
                                              Text(
                                                product.productName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                  "(${shoppingItem.quantity.toString()})"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: AppColors.green
                                                        .withOpacity(0.2)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Text(
                                                    "Confirmed",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                            color:
                                                                AppColors.black,
                                                            fontSize: 14),
                                                  ),
                                                ),
                                              ),
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
                                            '${shoppingItem.totalPrice.toString()} \$',
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
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Payment Method',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.grey)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Mastercard_2019_logo.svg/1200px-Mastercard_2019_logo.svg.png",
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Master Card',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(fontSize: 14),
                                          ),
                                          Text(
                                            'xxxxxxxx123',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.grey),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_forward),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${totalPrice.toString()}\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MainButton(
                          title: "Shipping Order",
                          onPressed: () async {
                            cubit.deleteData();
                            print();
                          },
                        ),
                      ],
                    ),
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
