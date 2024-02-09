import 'category.dart';

enum ProductSize {
  S,
  M,
  L,
  XL,
}

class Product {
  final String productId;
  final String productName;
  final int productPrice;
  final bool isFav;
  final ProductSize? size;
  final String productImg;
  final String productCategoryId;
  final String productDescribtion;

  Product(
      {required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productImg,
      required this.productDescribtion,
      required this.isFav,
      this.size,
      required this.productCategoryId});

  Product copyWith(
      {String? productId,
      String? productName,
      int? productPrice,
      String? productImg,
      String? productDescribtion,
      bool? isFav,
      ProductSize? size,
      String? productCategoryId}) {
    return Product(
        productId: productId ?? this.productCategoryId,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productImg: productImg ?? this.productImg,
        productDescribtion: productDescribtion ?? this.productDescribtion,
        isFav: isFav ?? this.isFav,
        size: size,
        productCategoryId: productCategoryId ?? this.productCategoryId);
  }
}

List<Product> dummy_product = [
  Product(
    productId: '1',
    productName: 'T-shirt',
    productPrice: 15,
    productDescribtion:
        'Comfortable cotton T-shirt in classic white, perfect for casual wear.',
    productImg:
        'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    isFav: false,
    productCategoryId: dummy_categories[1].categoryId,
  ),
  Product(
    productId: '2',
    productName: 'Black Shoes',
    productPrice: 14,
    productDescribtion:
        'Sleek black shoes with durable soles, ideal for both formal and casual occasions.',
    productImg: 'https://pngimg.com/d/men_shoes_PNG7475.png',
    isFav: false,
    productCategoryId: dummy_categories[2].categoryId,
  ),
  Product(
    productId: '3',
    productName: 'Trousers',
    productPrice: 16,
    productDescribtion:
        'Stylish and comfortable trousers made from high-quality fabric, suitable for office wear.',
    productImg:
        'https://www.pngall.com/wp-content/uploads/2016/09/Trouser-Free-Download-PNG.png',
    isFav: false,
    productCategoryId: dummy_categories[1].categoryId,
  ),
  Product(
    productId: '4',
    productName: 'Pack of Tomatoes',
    productPrice: 13,
    productDescribtion:
        'Fresh, ripe tomatoes packed with flavor, perfect for salads and cooking.',
    productImg:
        'https://parspng.com/wp-content/uploads/2022/12/tomatopng.parspng.com-6.png',
    isFav: false,
    productCategoryId: dummy_categories[3].categoryId,
  ),
  Product(
    productId: '5',
    productName: 'Pack of Potatoes',
    productPrice: 14,
    productDescribtion:
        'Versatile and hearty potatoes, great for baking, frying, or making mashed potatoes.',
    productImg: 'https://pngimg.com/d/potato_png2398.png',
    isFav: false,
    productCategoryId: dummy_categories[4].categoryId,
  ),
  Product(
    productId: '6',
    productName: 'Pack of Onions',
    productPrice: 5,
    productDescribtion:
        'Crisp and flavorful onions, an essential ingredient for a wide range of dishes.',
    productImg: 'https://pngimg.com/d/onion_PNG99213.png',
    isFav: false,
    productCategoryId: dummy_categories[4].categoryId,
  ),
  Product(
    productId: '7',
    productName: 'Pack of Apples',
    productPrice: 4,
    productDescribtion:
        'Juicy and sweet apples, perfect for snacking or baking.',
    productImg: 'https://pngfre.com/wp-content/uploads/apple-43-1024x1015.png',
    isFav: false,
    productCategoryId: dummy_categories[3].categoryId,
  ),
  Product(
    productId: '8',
    productName: 'Sweatshirt',
    productPrice: 4,
    productDescribtion: 'Cozy and warm sweatshirt, ideal for chilly days.',
    productImg:
        'https://www.usherbrand.com/cdn/shop/products/5uYjJeWpde9urtZyWKwFK4GHS6S3thwKRuYaMRph7bBDyqSZwZ_87x1mq24b2e7_1800x1800.png',
    isFav: false,
    productCategoryId: dummy_categories[1].categoryId,
  ),
  Product(
    productId: '9',
    productName: 'Pack of Mangoes',
    productPrice: 7,
    productDescribtion: 'Sweet and juicy mangoes, full of tropical flavor.',
    productImg: 'https://purepng.com/public/uploads/large/mango-tgy.png',
    isFav: false,
    productCategoryId: dummy_categories[3].categoryId,
  ),
  Product(
    productId: '10',
    productName: 'Pack of Bananas',
    productPrice: 7,
    productDescribtion:
        'Ripe bananas, rich in potassium and perfect for a healthy snack.',
    productImg:
        'https://static.vecteezy.com/system/resources/previews/015/100/096/original/bananas-transparent-background-free-png.png',
    isFav: false,
    productCategoryId: dummy_categories[3].categoryId,
  ),
];
