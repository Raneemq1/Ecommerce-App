class ApiPaths {
  static const users = '/users';
  static const ads = '/ads';
  static const categories = '/categories';
  static const products = 'products/';
  static String getProduct(String id) => 'products/$id';
  static String getUser(String id) => 'users/$id';
  static String getAds(String id) => 'ads/$id';
  static String getCategories(String id) => 'categories/$id';
}
