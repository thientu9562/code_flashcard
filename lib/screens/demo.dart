import 'dart:convert';
import 'package:flashcard/models/demo.dart';
import 'package:flashcard/services/demo_service.dart';
import 'package:flutter/material.dart';

class JsonParseDemo extends StatefulWidget {
  const JsonParseDemo({Key? key}) : super(key: key);

  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  List<Post>? _posts;
  bool? _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    PostService.getPosts().then((posts) {
      setState(() {
        _posts = posts;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json Parse Demo"),
      ),
      // body: FutureBuilder(
      //     builder: (context, snapshot) {
      //       var showData = json.decode(snapshot.data.toString());
      //       return ListView.builder(
      //         itemCount: null == _users ? 0 : _users?.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return ListTile(
      //             title: Text(showData[index]['name']),
      //             subtitle: Text(showData[index]['email']),
      //           );
      //         },
      //       );
      //     },
      //     future:
      //         DefaultAssetBundle.of(context).loadString("assets/users.json")),
      body: ListView.builder(
        itemCount: null == _posts ? 0 : _posts?.length,
        itemBuilder: (context, index) {
          Post post = _posts![index];
          return ListTile(
            title: Text(post.title!),
            subtitle: Text(post.author!),
          );
        },
      ),
    );
  }
}
