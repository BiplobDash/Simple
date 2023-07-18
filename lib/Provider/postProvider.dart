import 'package:better_half/Helper/postHelper.dart';
import 'package:better_half/Model/postModel.dart';
import 'package:flutter/material.dart';

class postProvider extends ChangeNotifier {
  List<Post> dataList = [];
  void updatedData(List<Post> dataList) {
    this.dataList = dataList;
    notifyListeners();
  }
}
