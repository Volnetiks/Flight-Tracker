class Image {
  final String url;
  final String webUrl;
  final String author;
  final String title;
  final String description;
  final String license;
  final List<String> htmlAttributions;

  Image({
    required this.url,
    required this.webUrl,
    required this.author,
    required this.title,
    required this.description,
    required this.license,
    required this.htmlAttributions,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json['url'],
      webUrl: json['webUrl'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      license: json['license'],
      htmlAttributions: List<String>.from(json['htmlAttributions']),
    );
  }
}
