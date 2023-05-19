import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController t1 = TextEditingController();
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                  controller: t1,
                  decoration: const InputDecoration(hintText: "Enter Num"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    cnt = int.parse(t1.text);
                    setState(() {});
                  },
                  child: Text("Ok"))
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: cnt,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 10, childAspectRatio: 2),
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          child: (index % 2 == 0)
                              ? Container(
                                  margin: EdgeInsets.all(10),
                                  height: 500,
                                  color: (index % 2 == 0)
                                      ? Colors.red
                                      : Colors.yellow,
                                  child: Center(
                                      child: (index % 2 == 0)
                                          ? Text(
                                              "${index + 1}",
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            )
                                          : Container()),
                                )
                              : Container()),
                      Expanded(
                          child: (index % 2 == 1)
                              ? Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 500,
                                  color: (index % 2 == 1)
                                      ? Colors.red
                                      : Colors.yellow,
                                  child: Center(
                                      child: (index % 2 == 1)
                                          ? Text(
                                              "${index + 1}",
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            )
                                          : Container()),
                                )
                              : Container())
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
