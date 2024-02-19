import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/cart.dart';
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
  @override
  Widget build(BuildContext context) {
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
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
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
                        Counter(),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Size',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (widget.product.size.toString() !=
                                        ProductSize.values[index].toString()) {
                                      widget.product = widget.product.copyWith(
                                        size: ProductSize.values[index],
                                      );
                                    } else {
                                      widget.product =
                                          widget.product.copyWith(size: null);
                                    }
                                  });
                                  debugPrint(widget.product.size.toString());
                                },
                                child: CircleAvatar(
                                    backgroundColor: widget.product.size ==
                                            ProductSize.values[index]
                                        ? AppColors.grey
                                        : AppColors.grey.withOpacity(0.4),
                                    radius: 20,
                                    child: Text(
                                      ProductSize.values[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: widget.product.size ==
                                                      ProductSize.values[index]
                                                  ? AppColors.white
                                                  : AppColors.black),
                                    )),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Description',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.product.productDescribtion),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.product.productPrice}\$',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                          ),
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.orange)),
                              onPressed: () {
                                DateTime date = DateTime.now();
                        
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
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
