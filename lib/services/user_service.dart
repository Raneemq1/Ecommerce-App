import 'package:ecommerce_app/model/user.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class UserService {
  Future<User?> getData();
}

class UserServiceImp implements UserService{

  final _firestoreService=FirestoreService.instance;
  @override
  Future<User?> getData() async{//why no return
    await _firestoreService.getCollection<User>(path:ApiPaths.users, builder:(data, documentId) => User.fromMap(data,documentId), );
   
  }

}
