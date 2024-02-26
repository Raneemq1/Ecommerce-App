import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/viewmodel/cubit/carousel/carousel_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/carousel/carousel_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CarouselCubit()..getData(),
      child: BlocBuilder<CarouselCubit, CarouselState>(
        builder: (context, state) {
          debugPrint('raneem $state.toString()');
          if (state is CarouselLoaded) {
            return CarouselSlider(
              options: CarouselOptions(height: 170.0, autoPlay: true),
              items: state.ads.map((ad) {
                return Builder(
                  builder: (BuildContext context) {
                    return CachedNetworkImage(
                      imageUrl: ad.adImg,
                      width: size.width * .65,
                      height: size.height,
                      fit: BoxFit.fill,
                    );
                  },
                );
              }).toList(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
