import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;
  const News(
      {required this.content,
      required this.publishedAt,
      required this.urlToImage,
      required this.description,
      required this.title});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [title, description, urlToImage, publishedAt, content];
}
