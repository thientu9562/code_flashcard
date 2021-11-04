import 'package:flashcard/models/demo.dart';
import 'package:http/http.dart' as http;

class PostService {
  static const String url = 'http://192.168.1.6:3000';

  static Future<List<Post>> getPosts() async {
    try {
      final res = await http.get(Uri.parse(url + "/posts"));
      print(res);
      if (200 == res.statusCode) {
        final List<Post> products = postFromJson(res.body);
        return products;
      } else {
        return <Post>[];
      }
    } catch (e) {
      return <Post>[];
    }
  }

  static Future<Post> getPostById(int id) async {
    try {
      final res = await http.get(Uri.parse(url + "/posts/" + id.toString()));
      print(res);
      if (200 == res.statusCode) {
        final Post posts = postFromJson(res.body) as Post;
        return posts;
      } else {
        return Post();
      }
    } catch (e) {
      return Post();
    }
  }

  // static Future<List<Post>> getProductsByCategoryId(int id) async {
  //   try {
  //     final res = await http
  //         .get(Uri.parse(url + "/category/" + id.toString() + "/products"));
  //     print(res);
  //     if (200 == res.statusCode) {
  //       final List<Post> posts = postFromJson(res.body);
  //       return posts;
  //     } else {
  //       return <Post>[];
  //     }
  //   } catch (e) {
  //     return <Post>[];
  //   }
  // }
}
