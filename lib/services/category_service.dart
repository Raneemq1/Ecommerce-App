import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class CategoryService {
  Future<List<Category>> getData();
}

class CategoryServiceImpl implements CategoryService {
  final _firestoreService = FirestoreService.instance;
  @override
  Future<List<Category>> getData() async {
    return await _firestoreService.getCollection<Category>(
      path: ApiPaths.categories,
      builder: (data, documentId) => Category.fromMap(data, documentId),
    );
  }
}
