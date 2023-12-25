import 'package:dio/dio.dart';
import 'package:webtask/core/error/exceptions.dart';
import 'package:webtask/core/network/error_message_model.dart';
import 'package:webtask/features/home/data/models/news_model.dart';

abstract class BaseGetAllNewsDataSource {
  Future<List<NewsModel>> getAllNews();
}

class GetAllNewsDataSource extends BaseGetAllNewsDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
    ),
  );


  @override
  Future<List<NewsModel>> getAllNews() async {
    final response = await _dio.get(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ae3664df4ada4929a07b8208a07e0b00');
    List<NewsModel> newsList = [];
    for (var element in response.data["articles"] as List) {
      newsList.add(NewsModel.fromJson(element));
    }
    if (response.statusCode == 200) {
      return newsList;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
