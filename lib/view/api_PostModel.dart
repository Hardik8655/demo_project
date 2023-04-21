import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/postModel.dart';

class ApiCallPostModel extends StatefulWidget {
  const ApiCallPostModel({Key? key}) : super(key: key);

  @override
  State<ApiCallPostModel> createState() => _ApiCallPostModelState();
}

class _ApiCallPostModelState extends State<ApiCallPostModel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
  }

  bool isApiLoading = true;
  List<PostModel> postList = [];

  getPost() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      postList.addAll(postModelFromJson(response.body));
      setState(() {
        isApiLoading = false;
      });
    } else {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST_MODEL_API_CALL"),
      ),
      body: isApiLoading && postList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(postList[index].id.toString()),
                        title:
                            Text(postList[index].title.toString(), maxLines: 1),
                        subtitle:
                            Text(postList[index].body.toString(), maxLines: 1),
                        trailing: Text(postList[index].userId.toString()),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(thickness: 1);
                    },
                  ),
                )
              ],
            ),
    );
  }
}
