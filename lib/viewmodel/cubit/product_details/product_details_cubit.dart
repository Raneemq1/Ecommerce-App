import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/viewmodel/cubit/product_details/product_details_status.dart';
import 'package:ecommerce_app/views/pages/product_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStatus> {
  ProductDetailsCubit() : super(ProductDetailsInitail());
  final homeService = HomeServiceImp();
  int quantity = 1;
  ProductSize? size;

  void getData(String productId) async {
    emit(ProductDetailsLoading());

    try {
      final products = await homeService.getData();
      Product product = products.firstWhere(
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
    if (quantity > 1) {
      quantity--;
      emit(QuantityChanged(quantity));
    }
  }

  void changeSize(ProductSize productSize) {
    size = productSize;
    emit(SizeChange(size));
  }
}
