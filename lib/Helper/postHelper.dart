import 'package:http/http.dart' as http;
import 'package:better_half/Model/postModel.dart';

class PostHelper {
  Future<List<Post>?> getPosts() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var data = response.body;
      return postFromJson(data);
    }
  }
}
