class PostServiceDetailModel {
  final dynamic id;
  final String title;
  final String content;
  final List<dynamic> images;
  final double latitude;
  final double longitude;
  final Map<String, dynamic> featuredImage;
  final String street;
  final String city;
  final String country;
  final String link;
  final String date;
  // final List<dynamic> reviews;

  PostServiceDetailModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.images,
      this.latitude = 0.00,
      this.longitude = 0.00,
      required this.featuredImage,
      required this.street,
      required this.city,
      required this.country,
      required this.date,
      required this.link
      // required this.reviews,
      });

  factory PostServiceDetailModel.fromJson(Map<String, dynamic> json) {
    return PostServiceDetailModel(
      id: json['id'],
      title: json['title']['raw'],
      content: json['content']['rendered'],
      images: json['images'],
      link: json['link'],

      latitude: json['latitude'] != null && json['latitude'] != ""
          ? double.parse(json['latitude'])
          : 0.00,
      longitude: json['longitude'] != null && json['longitude'] != ""
          ? double.parse(json['longitude'])
          : 0.00,
      featuredImage: json['featured_image'],
      street: json['street'],
      city: json['city'],
      country: json['country'],
      date: json['date'],
      // reviews: json['reviews'],
    );
  }
}
