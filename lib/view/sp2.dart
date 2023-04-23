import 'package:ankit/utils/utils.dart';
import 'package:flutter/material.dart';

class Sp2 extends StatefulWidget {
  const Sp2({Key? key}) : super(key: key);

  @override
  State<Sp2> createState() => _Sp2State();
}

class _Sp2State extends State<Sp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailes"),
      ),
      body: Column(children: [
        ListTile(
            title: Text(SharedPrefService().readFromSharedPref('name', String)),
            subtitle: Text(SharedPrefService().readFromSharedPref('age', String)),
        ),
      ],),
    );
  }
}
