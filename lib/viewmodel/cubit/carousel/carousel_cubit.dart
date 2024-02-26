import 'package:ecommerce_app/services/ads_service.dart';
import 'package:ecommerce_app/viewmodel/cubit/carousel/carousel_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselInitial());
  final _adsService = AdsServiceImp();

  void getData() async {
    emit(CarouselLoading());
    try {
      final ads = await _adsService.getData();
      emit(CarouselLoaded(ads));
    } catch (e) {
      debugPrint('raneem $e.toString()');
      emit(CarouselFaliure(e.toString()));
    }
  }
}
