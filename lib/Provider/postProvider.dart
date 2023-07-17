import 'package:better_half/Helper/postHelper.dart';
import 'package:better_half/Model/postModel.dart';
import 'package:flutter/material.dart';

class postProvider extends ChangeNotifier {
  List<Post>? posts;
  bool isLoaded = false;
  getData() async {
    posts = await PostHelper().getPosts();
    notifyListeners();
  }
}
