import 'dart:developer';

import 'package:ankit/utils/dbHelper.dart';

import 'package:flutter/material.dart';


DbHelper database = DbHelper();
class SqfScreen extends StatefulWidget {
  const SqfScreen({Key? key}) : super(key: key);

  @override
  State<SqfScreen> createState() => _SqfScreenState();
}

class _SqfScreenState extends State<SqfScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    database.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQL"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            database.insert({"name":"hardik","age":12});
          }, child: const Text("Insert")),
          ElevatedButton(onPressed: () {
            database.update({"name":"Harry","age":22},3);
          }, child: const Text("update")),
          ElevatedButton(onPressed: () {
            database.delete(1);
          }, child: const Text("delete")),
          ElevatedButton(onPressed: () async {
            log((await database.getData()).toString());
          }, child: const Text("getData")),
        ],
      ),
    );
  }
}
