import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/viewmodel/cubit/product_details/product_details_status.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStatus> {
  ProductDetailsCubit() : super(ProductDetailsInitail());
  int quantity = 1;
  void getData(String productId) async {
    emit(ProductDetailsLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));
      Product product = dummy_product.firstWhere(
        (product) => product.productId == productId,
      );
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  void incremant() {
    quantity++;
    emit(QuantityChanged(quantity));
  }

  void decremant() {
    if(quantity>1){
      quantity--;
    emit(QuantityChanged(quantity));
    }
  }
}
