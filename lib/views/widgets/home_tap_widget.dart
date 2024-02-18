import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/home/home_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/home/home_status.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:ecommerce_app/views/widgets/custom_carousel.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getData();
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeStatus>(
        buildWhen: (previous, current) =>
            current is HomeLoading ||
            current is HomeLoaded ||
            current is HomeError,
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is HomeLoaded) {
            List<Product> dummyProducts = state.dummyProducts;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemCount: dummyProducts.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                          product: dummyProducts[index])));
                            },
                            child: Card(
                              child: Stack(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              dummyProducts[index].productImg,
                                          height: 100,
                                          width: 150,
                                          fit: BoxFit.contain),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(dummyProducts[index].productName),
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      // Access the HomeCubit instance provided by BlocProvider
                                      final cubit = context.read<HomeCubit>();
                                      cubit.changeFavoriteStatus(
                                          dummyProducts[index], index);
                                      debugPrint(
                                          'Raneem check ${dummyProducts[index].isFav}');
                                    },
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: AppColors.bgColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(
                                        dummyProducts[index].isFav == true
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
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
