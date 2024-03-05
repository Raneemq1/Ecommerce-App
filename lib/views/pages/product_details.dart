import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/services/cart_service.dart';
import 'package:ecommerce_app/viewmodel/cubit/product_details/product_details_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/product_details/product_details_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widgets/counter.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _cartService = CartServiceImp();
  @override
  Widget build(BuildContext context) {
    bool switctValue = true;
    ProductSize? size;
    int quantity;

    return BlocProvider(
      create: (context) => ProductDetailsCubit(),
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<ProductDetailsCubit>(context);
        return BlocBuilder<ProductDetailsCubit, ProductDetailsStatus>(
          bloc: cubit,
          builder: (context, state) {
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: AppColors.transparent,
                  actions: const [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.shop),
                    )
                  ],
                ),
                body: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.product.productImg,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 300),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: AppColors.bgColor,
                            borderRadius: BorderRadiusDirectional.vertical(
                                top: Radius.circular(50))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.productName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: AppColors.orange,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text('4.8'),
                                  ],
                                ),
                                BlocBuilder<ProductDetailsCubit,
                                    ProductDetailsStatus>(
                                  buildWhen: (previous, current) =>
                                      current is QuantityChanged,
                                  builder: (context, state) {
                                    if (state is QuantityChanged) {
                                      return Counter(
                                        cubit: cubit,
                                        counter: state.quantity,
                                      );
                                    } else {
                                      return Counter(
                                        cubit: cubit,
                                        counter: 1,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Size',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 60,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ProductSize.values.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: BlocBuilder<ProductDetailsCubit,
                                          ProductDetailsStatus>(
                                        buildWhen: (previous, current) =>
                                            current is SizeChange,
                                        builder: (context, state) {
                                          if (state is SizeChange) {
                                            return InkWell(
                                              onTap: () {
                                                cubit.changeSize(
                                                    ProductSize.values[index]);
                                              },
                                              child: CircleAvatar(
                                                  backgroundColor: state.size ==
                                                          ProductSize
                                                              .values[index]
                                                      ? AppColors.orange
                                                      : AppColors.grey
                                                          .withOpacity(0.4),
                                                  radius: 20,
                                                  child: Text(
                                                    ProductSize
                                                        .values[index].name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: state.size ==
                                                                    ProductSize
                                                                            .values[
                                                                        index]
                                                                ? AppColors
                                                                    .white
                                                                : AppColors
                                                                    .black),
                                                  )),
                                            );
                                          } else {
                                            return InkWell(
                                              onTap: () {
                                                cubit.changeSize(
                                                    ProductSize.values[index]);
                                              },
                                              child: CircleAvatar(
                                                  backgroundColor: AppColors
                                                      .grey
                                                      .withOpacity(0.4),
                                                  radius: 20,
                                                  child: Text(
                                                    ProductSize
                                                        .values[index].name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .black),
                                                  )),
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Description',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(widget.product.productDescribtion),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BlocBuilder<ProductDetailsCubit,
                                      ProductDetailsStatus>(
                                    bloc: cubit,
                                    buildWhen: (previous, current) =>
                                        current is QuantityChanged,
                                    builder: (context, state) {
                                      if (state is QuantityChanged) {
                                        return Text(
                                          '${widget.product.productPrice * state.quantity}\$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                        );
                                      } else {
                                        return Text(
                                          '${widget.product.productPrice}\$',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                        );
                                      }
                                    },
                                  ),
                                  BlocBuilder<ProductDetailsCubit,
                                      ProductDetailsStatus>(
                                    bloc: cubit,
                                    buildWhen: (previous, current) =>
                                        current is QuantityChanged ||
                                        current is SizeChange,
                                    builder: (context, state) {
                                      if (state is SizeChange) {
                                        size = state.size;
                                      }
                                      if (state is QuantityChanged) {
                                        quantity = state.quantity;

                                        return ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                              (states) => switctValue
                                                  ? AppColors.orange
                                                  : AppColors.grey,
                                            )),
                                            onPressed: () {
                                              if (switctValue) {
                                                String id = const Uuid().v1();

                                                final cart = Cart(
                                                    id: id,
                                                    productId: widget
                                                        .product.productId,
                                                    quantity: quantity,
                                                    totalPrice: widget.product
                                                            .productPrice *
                                                        double.parse(quantity
                                                            .toString()),
                                                    status: 'Pending');
                                                //shoppingCart.add(cart);
                                                _cartService.setData(cart);
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: Text('Add to cart'),
                                                    content: Text(
                                                        'Added sucessfully to the cart'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          // Close the AlertDialog
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('Close'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                                switctValue = false;
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          title: const Text(
                                                              'Retry'),
                                                          content: const Text(
                                                              'This added before to the cart'),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'close'))
                                                          ],
                                                        ));
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.shop_2,
                                                  color: AppColors.white,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Add to cart',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 16,
                                                        color: AppColors.white,
                                                      ),
                                                )
                                              ],
                                            ));
                                      } else {
                                        return ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                              (states) => switctValue
                                                  ? AppColors.orange
                                                  : AppColors.grey,
                                            )),
                                            onPressed: () {
                                              if (switctValue) {
                                                String id = const Uuid().v1();

                                                final cart = Cart(
                                                    id: id,
                                                    productId: widget
                                                        .product.productId,
                                                    quantity: 1,
                                                    totalPrice: widget.product
                                                            .productPrice *
                                                        1.0,
                                                    status: 'Pending');
                                                //shoppingCart.add(cart);
                                                _cartService.setData(cart);
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: Text('Add to cart'),
                                                    content: Text(
                                                        'Added sucessfully to the cart'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          // Close the AlertDialog
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('Close'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                                switctValue = false;
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          title: const Text(
                                                              'Retry'),
                                                          content: const Text(
                                                              'This added before to the cart'),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'close'))
                                                          ],
                                                        ));
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.shop_2,
                                                  color: AppColors.white,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Add to cart',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 16,
                                                        color: AppColors.white,
                                                      ),
                                                )
                                              ],
                                            ));
                                      }
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          },
        );
      }),
    );
  }
}
