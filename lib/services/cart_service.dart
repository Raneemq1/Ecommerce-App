import 'package:ecommerce_app/model/cart.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/services/user_service.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class CartService {
  void setData(Cart cart);
  void deleteData(String cartId);
  Future<List<Cart>> getData();
}

class CartServiceImp extends CartService {
  final _fireStoreService = FirestoreService.instance;
  final _authService = AuthenticationServiceImpl();
  final _userService = UserServiceImp();

  @override
  void setData(Cart cart) async {
    var uid = await getUid();
    await _fireStoreService.setData(
        path: ApiPaths.getOrders(uid, cart.id), data: cart.toMap());
  }

  @override
  void deleteData(String cartId) async {
    var uid = await getUid();
    await _fireStoreService.deleteData(path: ApiPaths.getOrders(uid, cartId));
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

  @override
  Future<List<Cart>> getData() async {
    var uid = await getUid();
    return await _fireStoreService.getCollection<Cart>(
      path: ApiPaths.getUserOrders(uid),
      builder: (data, documentId) => Cart.fromMap(data, documentId),
    );
  
  }
}
