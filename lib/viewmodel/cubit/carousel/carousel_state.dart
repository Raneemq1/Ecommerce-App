import 'package:ecommerce_app/model/ads.dart';

class CarouselState {}

class CarouselInitial extends CarouselState {}

class CarouselLoading extends CarouselState {}

class CarouselLoaded extends CarouselState {
  final List<Ads> ads;
  CarouselLoaded(this.ads);
}

class CarouselFaliure extends CarouselState {
  final String msg;

  CarouselFaliure(this.msg);
}
