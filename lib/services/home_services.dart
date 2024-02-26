import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class HomeService {
  Future<List<Product>> getData();
  void updateProduct(Product product);
}

class HomeServiceImp extends HomeService {
  final _firestoreService = FirestoreService.instance;

  Future<List<Product>> getData() async {
    return await _firestoreService.getCollection<Product>(
      path: ApiPaths.products,
      builder: (data, documentId) {
        return Product.fromMap(data, documentId);
      },
    );
  }

  @override
  void updateProduct(Product product) async {
    await _firestoreService.setData(
        path: ApiPaths.getProduct(product.productId), data: product.toMap());
  }
}
