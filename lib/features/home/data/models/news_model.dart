import 'package:webtask/features/home/domain/entities/news_entity.dart';

class NewsModel extends News {
  const NewsModel(
      {required super.content,
      required super.publishedAt,
      required super.urlToImage,
      required super.description,
      required super.title});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      content: json["content"],
      publishedAt: json["publishedAt"],
      urlToImage: json["urlToImage"],
      description: json["description"],
      title: json["title"]);
}
