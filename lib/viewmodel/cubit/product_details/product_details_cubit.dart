import 'package:ecommerce_app/viewmodel/cubit/product_details/product_details_status.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStatus> {
  ProductDetailsCubit() : super(ProductDetailsInitail());

  void getData() async {
    emit(ProductDetailsLoading());

    try {
      await Future.delayed(Duration(seconds: 2));
      emit(ProductDetailsLoaded());
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }
}
