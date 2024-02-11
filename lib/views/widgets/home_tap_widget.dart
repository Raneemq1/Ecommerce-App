import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:ecommerce_app/views/widgets/custom_carousel.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  String selected = '';
  late Product updatedProduct;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            const CustomCarousel(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Arrivals',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'See More',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: dummy_product.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  product: dummy_product[index])));
                    },
                    child: Card(
                      child: Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: CachedNetworkImage(
                                  imageUrl: dummy_product[index].productImg,
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.contain),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(dummy_product[index].productName),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              //check favorite icon and add to favProduct list
                              if (dummy_product[index].isFav) {
                                updatedProduct =
                                    dummy_product[index].copyWith(isFav: false);
                              } else {
                                updatedProduct =
                                    dummy_product[index].copyWith(isFav: true);
                              }
                              setState(() {
                                dummy_product[index] = updatedProduct;
                                if (updatedProduct.isFav) {
                                  favProduct.add(updatedProduct);
                                } else {
                                  favProduct.removeWhere((product) =>
                                      product.productId ==
                                      updatedProduct.productId);
                                }
                              });
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: AppColors.bgColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                dummy_product[index].isFav == true
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: AppColors.orange,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
