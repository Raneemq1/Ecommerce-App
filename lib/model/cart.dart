import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String productId;
  final String status;
  final int quantity;
  final double totalPrice;
  final ProductSize? size;

  Cart(
      {required this.id,
      required this.productId,
      required this.quantity,
      required this.totalPrice,
      required this.status,
      required this.size});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'status': status,
      'size':size?.toString()
    };
  }

  factory Cart.fromMap(Map<String, dynamic> data, String id) {
    Cart cart = Cart(
      id: id,
      productId: data['productId'] ?? '',
      quantity: data['quantity'] ?? 0,
      totalPrice: data['totalPrice'] ?? 0.0,
      status: data['status'] ?? '',
      size:  data['size'] != null ?getSizeFromString(data['size']) : null,
    );

    return cart;
  }
}
//Use this method to convert string to ProductSize type
ProductSize? getSizeFromString(String? sizeString) {
  if (sizeString == null) return null;
  return ProductSize.values.firstWhere(
    (size) => size.toString() == sizeString,
   
  );
}