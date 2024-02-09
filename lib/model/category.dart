class Category {
  final String categoryName;
  final String categoryId;
  final String categoryImg;

  Category(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryImg});
}

List<Category> dummy_categories = [
  Category(
      categoryId: '1',
      categoryName: 'New Arrivals',
      categoryImg:
          'https://assets.hermes.com/is/image/hermesproduct/h-embroidered-t-shirt--072025HA01-worn-1-0-0-1000-1000_g.jpg'),
  Category(
      categoryId: '2',
      categoryName: 'Clothes',
      categoryImg:
          'https://tshirthero.ae/wp-content/uploads/2023/06/one-piece.jpg'),
  Category(
      categoryId: '3',
      categoryName: 'Shoses',
      categoryImg:
          'https://ae01.alicdn.com/kf/S64628eb6f93342e08c0975e90ac5c578l.jpg_640x640q90.jpg'),
  Category(
      categoryId: '4',
      categoryName: 'Fruit',
      categoryImg:
          'https://static.vecteezy.com/system/resources/previews/001/995/538/non_2x/oranges-fruits-with-high-vitamin-c-and-green-leaves-isolated-on-a-white-background-with-the-clipping-path-free-photo.jpg'),
  Category(
      categoryId: '5',
      categoryName: 'Vegatabls',
      categoryImg:
          'https://images.ctfassets.net/4f3rgqwzdznj/4A0uyWNYGgiXvKcFlEnPS6/a7df67c300dc9f0ffe66243c5802c87e/broccoli_green_background_829282730.jpg'),
];
