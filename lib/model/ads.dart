class Ads {
  final String adId;
  final String adImg;

  Ads({required this.adId, required this.adImg});

  Map<String, dynamic> toMap() {
    return {'adsId': adId, 'adsImg': adImg};
  }

  factory Ads.fromMap(Map<String, dynamic> map, String id) {
    return Ads(adId: id, adImg: map['adsImg'] ?? '');
  }
}

List<Ads> dummy_ads = [
  Ads(
      adId: '12',
      adImg:
          'https://marketplace.canva.com/EAFMdLQAxDU/1/0/1600w/canva-white-and-gray-modern-real-estate-modern-home-banner-NpQukS8X1oo.jpg'),
  Ads(
      adId: '11',
      adImg:
          'https://edit.org/photos/img/blog/mbp-template-banner-online-store-free.jpg-840.jpg'),
  Ads(
      adId: '10',
      adImg:
          'https://casalsonline.es/wp-content/uploads/2018/12/CASALS-ONLINE-18-DICIEMBRE.png')
];
