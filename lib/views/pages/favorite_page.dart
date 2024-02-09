import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<Product> filteredProducts;
  late List<Product> filteredProductBefore;
  int selected = -1;
  @override
  void initState() {
    super.initState();
    filteredProducts = dummy_product;
  }

  @override
  Widget build(BuildContext context) {
    late Product updatedProduct;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                onTap: () {
                  filteredProductBefore = filteredProducts;
                },
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      filteredProducts = filteredProductBefore;
                    } else {
                      filteredProducts = filteredProducts
                          .where((product) => product.productName
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    }
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummy_categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (selected == -1 ||
                              selected !=
                                  int.parse(
                                      dummy_categories[index].categoryId)) {
                            selected =
                                int.parse(dummy_categories[index].categoryId);
                          } else if (selected ==
                              int.parse(dummy_categories[index].categoryId)) {
                            selected = -1;
                          }

                          filteredProducts = dummy_product.where((product) {
                            return dummy_categories[index].categoryName ==
                                dummy_categories[
                                        int.parse(product.productCategoryId) -
                                            1]
                                    .categoryName;
                          }).toList();

                          if (selected == -1) {
                            filteredProducts = dummy_product;
                          }
                        });
                      },
                      child: SizedBox(
                        width: 100,
                        child: Card(
                          color: selected ==
                                  int.parse(dummy_categories[index].categoryId)
                              ? AppColors.orange
                              : AppColors.bgColor,
                          child: Center(
                              child: Text(
                            dummy_categories[index].categoryName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: selected ==
                                            int.parse(dummy_categories[index]
                                                .categoryId)
                                        ? AppColors.white
                                        : AppColors.black),
                          )),
                        ),
                      ),
                    );
                  }),
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
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  product: filteredProducts[index])));
                    },
                    child: Card(
                      child: Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: CachedNetworkImage(
                                  imageUrl: filteredProducts[index].productImg,
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.contain),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(filteredProducts[index].productName)
                          ],
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              if (filteredProducts[index].isFav == true) {
                                updatedProduct = filteredProducts[index]
                                    .copyWith(isFav: false);
                              } else {
                                updatedProduct = filteredProducts[index]
                                    .copyWith(isFav: true);
                              }
                              setState(() {
                                filteredProducts[index] = updatedProduct;
                              });
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: AppColors.bgColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                filteredProducts[index].isFav == true
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
                }),
          ],
        ),
      ),
    );
  }
}
