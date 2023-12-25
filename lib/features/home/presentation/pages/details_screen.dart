import 'package:flutter/material.dart';
import 'package:webtask/features/home/domain/entities/news_entity.dart';

class DetailsScreen extends StatelessWidget {
  final News news;
  const DetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title, style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            news.urlToImage,
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(height: 5,),
          Text(
            news.title,
            style:
               const  TextStyle(height: 2, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),
          Text(
            news.description,
            style:
                const TextStyle(height: 1, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),
          Text(
            news.content,
            style: const TextStyle(
                height: 1.5, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),
          Text(
            news.publishedAt,
            style: const  TextStyle(
                height: 2,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
          const SizedBox(height: 5,),

        ]),
      ),
    );
  }
}
