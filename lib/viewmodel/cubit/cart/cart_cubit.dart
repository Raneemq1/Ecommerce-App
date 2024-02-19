import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/viewmodel/cubit/cart/cart_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStatus> {
  CartCubit() : super(CartInitial());

  void getData() async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(CartLoaded(shoppingCart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
