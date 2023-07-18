import 'dart:convert';

import 'package:better_half/Model/postModel.dart';
import 'package:http/http.dart' as http;

class PostHelper {
  Future<List<Post>> getData() async {
    List<Post> listData = [];
    try {
      var request = http.Request(
          'GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(rawData);
        data.forEach((element) {
          Post model = Post.fromJson(element);
          listData.add(model);
        });
        return listData;
      } else {
        print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      print('Exception in $e');
      throw e;
    }
  }
}
