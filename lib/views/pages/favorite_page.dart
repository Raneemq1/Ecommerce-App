import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/favorite/favorite_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/favorite/favorite_status.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    filteredProducts = favProduct;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = FavoriteCubit();
        cubit.getData();
        return cubit;
      },
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<FavoriteCubit>(context);
        return BlocBuilder<FavoriteCubit, FavoriteStatus>(
          bloc: cubit,
          buildWhen: (previous, current) =>
              current is FavoriteLoading ||
              current is FavoriteLoaded ||
              current is FavoriteError,
          builder: (context, state) {
            if (state is FavoriteLoaded) {
              final dummyCat = state.dummyCategorites;
              final favProducts = state.favProducts;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: TextField(
                          //text field must be in statefull
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                filteredProducts = favProducts;
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
                            itemCount: dummyCat.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    //check if no category check or a different category chose
                                    if (selected == -1 ||
                                        selected !=
                                            int.parse(
                                                dummyCat[index].categoryId)) {
                                      selected =
                                          int.parse(dummyCat[index].categoryId);
                                    }
                                    //check it the same category choose
                                    else if (selected ==
                                        int.parse(dummyCat[index].categoryId)) {
                                      selected = -1;
                                    }

                                    //to put a favorite products from certain category
                                    filteredProducts =
                                        favProducts.where((product) {
                                      return dummyCat[index].categoryName ==
                                          dummyCat[int.parse(product
                                                      .productCategoryId) -
                                                  1]
                                              .categoryName;
                                    }).toList();

                                    if (selected == -1) {
                                      //to put a favorite products with no constrains on category name
                                      filteredProducts = favProducts;
                                    }
                                  });
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: Card(
                                    color: selected ==
                                            int.parse(
                                                dummyCat[index].categoryId)
                                        ? AppColors.orange
                                        : AppColors.bgColor,
                                    child: Center(
                                        child: Text(
                                      dummyCat[index].categoryName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: selected ==
                                                      int.parse(dummyCat[index]
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
                      filteredProducts.isEmpty
                          //note: expanded inside col within singleScroll child view
                          ? const SizedBox(
                              height: 350,
                              child: Center(
                                child: Text('no favorite products yet'),
                              ),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                              itemCount: filteredProducts.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(
                                                    product: filteredProducts[
                                                        index])));
                                  },
                                  child: Card(
                                    child: Stack(children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: CachedNetworkImage(
                                                imageUrl:
                                                    filteredProducts[index]
                                                        .productImg,
                                                height: 100,
                                                width: 150,
                                                fit: BoxFit.contain),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(filteredProducts[index]
                                              .productName)
                                        ],
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: InkWell(
                                          onTap: () {
                                            Product product =
                                                filteredProducts[index];
                                            if (filteredProducts.length !=
                                                favProducts.length) {
                                              filteredProducts.remove(product);
                                            }
                                            //unfavorite product and update isFav bool
                                            
                                            cubit.changeFavoriteStatus(product);
                                          },
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: AppColors.bgColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Icon(
                                              filteredProducts[index].isFav
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
            } else if (state is FavoriteLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      }),
    );
  }
}
