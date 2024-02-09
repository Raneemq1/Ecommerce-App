import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesTap extends StatelessWidget {
  const CategoriesTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummy_categories.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          debugPrint(dummy_categories[index].categoryName);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Card(
                child: CachedNetworkImage(
                    imageUrl: dummy_categories[index].categoryImg,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
              Positioned(
                  bottom: 60,
                  left: 15,
                  child: Column(
                    children: [
                      Text(
                        dummy_categories[index].categoryName,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      Text(
                          '${countProductsInCategory(dummy_categories[index].categoryName).toString()} Product'),
                    ],
                  )),
            ]),
          );
        });
  }
}

int countProductsInCategory(String categoryName) {
  int count = 0;
  dummy_product.forEach((element) {
    dummy_categories[int.parse(element.productCategoryId) - 1].categoryName ==
            categoryName
        ? count++
        : 0;
  });
  return count;
}
