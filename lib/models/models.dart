class NewsModel {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'author',
        title: json["title"] ?? 'title',
        description: json["description"] ?? 'description',
        url: json["url"] ?? 'url',
        urlToImage: json["urlToImage"] ?? 'urlToImage',
        publishedAt: DateTime.parse(json["publishedAt"] ?? 'publishedAt'),
        content: json["content"] ?? 'content',
      );
}

class Source {
  final String id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json['id'] ?? 'id', name: json['name'] ?? 'name');
}
