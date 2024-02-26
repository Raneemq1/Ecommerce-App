import 'package:ecommerce_app/model/ads.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';

abstract class AdsService {
  Future<List<Ads>> getData();
}

class AdsServiceImp implements AdsService {
  final _firestoreService = FirestoreService.instance;
  @override
  Future<List<Ads>> getData() async {
    return await _firestoreService.getCollection<Ads>(
      path: ApiPaths.ads,
      builder: (data, documentId) => Ads.fromMap(data, documentId),
    );
  }
}
