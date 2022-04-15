import 'package:flutter/material.dart';
import 'package:flutter_rest_api_mvvm/repositories/posts/posts_api.dart';
import 'package:flutter_rest_api_mvvm/view_models/post_view_model.dart';
import 'package:flutter_rest_api_mvvm/view_models/posts_view_model.dart';

class PostsView extends StatelessWidget {
  PostsView({Key? key}) : super(key: key);
  //Dependency Injection
  var postsViewModel = PostsViewModel(postsRepository: PostsAPI());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: FutureBuilder<List<PostViewModel>>(
          future: postsViewModel.fetchAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var posts = snapshot.data;
              return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(posts![index].title),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
