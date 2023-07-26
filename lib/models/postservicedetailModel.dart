class PostServiceDetailModel {
  final String id;
  final String title;
  final String content;
  final List<dynamic> images;
  final double latitude;
  final double longitude;
  final Map<String, dynamic> featuredImage;
  final String street;
  final String city;
  final String country;
  final String date;


  // final List<dynamic> reviews;

  PostServiceDetailModel({
    required this.id,
    required this.title,
    required this.content,
    required this.images,
    required this.latitude,
    required this.longitude,
    required this.featuredImage,
    required this.street,
    required this.city,
    required this.country,
    required this.date,
    // required this.reviews,
  });

  factory PostServiceDetailModel.fromJson(Map<String, dynamic> json) {
    return PostServiceDetailModel(
      id: json['id'],
      title: json['title']
          ['raw'], // Access the 'raw' property inside the 'title' map
      content: json['content']
          ['rendered'], // Access the 'raw' property inside the 'content' map
      images: json['images'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      featuredImage: json['featured_image'],
      street: json['street'],
      city: json['city'],
      country: json['country'],
      date: json['date'],
      // reviews: json['reviews'],
    );
  }
}
