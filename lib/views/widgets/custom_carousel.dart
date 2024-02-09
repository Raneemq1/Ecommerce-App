import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/ads.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(height: 170.0, autoPlay: true),
      items: dummy_ads.map((ad) {
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
  }
}
