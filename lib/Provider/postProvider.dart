import 'package:better_half/Helper/postHelper.dart';
import 'package:better_half/Model/postModel.dart';
import 'package:flutter/material.dart';

class postProvider extends ChangeNotifier {
  List<Post> _dataList = [];
  set dataList(List<Post> v){
    _dataList = v;
    notifyListeners();
  }
  void updatedData(List<Post> dataList) {
    _dataList = dataList;
    notifyListeners();
  }
  List<Post> get dataList => _dataList;
}