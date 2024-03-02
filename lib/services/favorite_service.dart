import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class FavoriteService {
  void setData(String id);
  void deleteData(String id);
  Future<List<Product>> getData();
}

class FavoriteServiceImpl extends FavoriteService {
  final _fireStoreService = FirestoreService.instance;
  final _authService = AuthenticationServiceImpl();
  final _userService = UserServiceImp();
  final _homeService = HomeServiceImp();
  @override
  void setData(String id) async {
    String uid = await getUid();
    _fireStoreService
        .setData(path: ApiPaths.getFavorite(uid, id), data: {'productId': id});
  }

  @override
  void deleteData(String id) async {
    String uid = await getUid();

    await _fireStoreService.deleteData(path: ApiPaths.getFavorite(uid, id));
  }

  @override
  Future<List<Product>> getData() async {
    
     List<Product> prefrencesUser = [];
    final products = await _homeService.getData();
    
    List<String> productIds = [];
    String uid = await getUid();
    await _fireStoreService.getCollection(
      path: ApiPaths.getUserFavPrefrences(uid),
      builder: (data, documentID) {
        // Extract productId from data and add it to productIds list
        String productId = data['productId'];
        productIds.add(productId);
      },
    );
    productIds.forEach((id) {
      products.forEach((product) {
        if (product.productId == id) {
          prefrencesUser.add(product);
         
        }
      });
    });
    return prefrencesUser;
  }

  Future<String> getUid() async {
    final user = await _authService.currentUser();
    //instead of this use getCertain data to return specifc data
    final users = await _userService.getData();
    final dummyUserData =
        users.firstWhere((element) => element.email == user?.email);
    String uid = dummyUserData.id;
    return uid;
  }
}
