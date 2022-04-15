import 'package:dio/dio.dart';
import 'package:flutter_rest_api_mvvm/models/post_model.dart';
import 'package:flutter_rest_api_mvvm/repositories/posts/post_repository.dart';
import 'package:flutter_rest_api_mvvm/view_models/post_view_model.dart';

class PostsViewModel {
  final String title = "All Posts";
  PostsRepository? postsRepository;
  PostsViewModel({this.postsRepository});

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostModel> list = await postsRepository!.getAllPosts();
    return list.map((post) => PostViewModel(postModel: post)).toList();
  }
}
