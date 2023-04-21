import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

// class Sp extends StatefulWidget {
//   const Sp({Key? key}) : super(key: key);
//
//   @override
//   State<Sp> createState() => _SpState();
// }
//
// class _SpState extends State<Sp> {
//   TextEditingController controller = TextEditingController();
//   TextEditingController C2 = TextEditingController();
//   late SharedPreferences Sp;
//   String temp = "";
//
//   addData() async {
//     Sp = await SharedPreferences.getInstance();
//     Sp.setString("name", controller.text.toString());
//     Sp.setString("Age", C2.text.toString());
//   }
//
//   showData() async {
//     Sp = await SharedPreferences.getInstance();
//     setState(() {
//       temp = Sp.getString("name").toString();
//     });
//   }
//
//   deleteData() async {
//     Sp = await SharedPreferences.getInstance();
//     Sp.remove("name");
//     setState(() {
//       temp = " ";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           //crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                 child: TextField(
//                     controller: controller,
//                     decoration: const InputDecoration(
//                       labelText: 'Name...',
//                       border: OutlineInputBorder(),
//                     ))),
//             Container(
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                 child: TextField(
//                     controller: C2,
//                     decoration: const InputDecoration(
//                       labelText: 'Age...',
//                       border: OutlineInputBorder(),
//                     ))),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                     margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         addData();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green,
//                       ),
//                       child: const Text('Save'),
//                     )),
//                 Container(
//                     margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
//                     child: ElevatedButton(
//                       onPressed: () => showData(),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green,
//                       ),
//                       child: const Text('Display'),
//                     )),
//                 Container(
//                     margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
//                     child: ElevatedButton(
//                       onPressed: () => deleteData(),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green,
//                       ),
//                       child: const Text('Delete'),
//                     )),
//               ],
//             ),
//             Container(
//                 margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
//                 child: Text(
//                   temp.toString(),
//                   style: const TextStyle(fontSize: 25, color: Colors.black),
//                   textAlign: TextAlign.center,
//                 ))
//           ],
//         ),
//       )),
//     );
//   }
// }
class Sp extends StatefulWidget {
  const Sp({Key? key}) : super(key: key);

  @override
  State<Sp> createState() => _SpState();
}

class _SpState extends State<Sp> {
  TextEditingController C1 = TextEditingController();
  TextEditingController C2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared pref"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: C1,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Enter name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: C2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter age",
                  labelText: "Age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("name", C1.text.toString());
                  prefs.setString("age", C2.text.toString());
                },
                child: const Text("Save"),
              ),
              ElevatedButton(
                onPressed: () async {
                  getData();
                  await Utils.setLogin(isLogin: true);
                },
                child: const Text("get-value"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      C1.text = prefs.getString('name') ?? "";
      C2.text = prefs.getString('age') ?? "";
    });
  }
}
