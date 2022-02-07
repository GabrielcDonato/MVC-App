import 'package:dio/dio.dart';
import 'package:movie_app/models/post_model.dart';

import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    try {
      var response =
          await Dio().get('http://jsonplaceholder.typicode.com/posts');
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return [];
  }
}
