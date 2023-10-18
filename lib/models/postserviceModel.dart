class PostServiceModel {
  final int id;
  final String title;
  final String link;
  final String content;
  final String image;

  PostServiceModel({
    required this.id,
    required this.title,
    required this.link,
    required this.content,
    required this.image,
  });

  factory PostServiceModel.fromJson(Map<String, dynamic> json) {
    return PostServiceModel(
      id: json['id'],
      title: json['title']['raw'],
      link: json['link'],
      content: json['content']['raw'],
      image: json['featured_image']['src'],
    );
  }
}
