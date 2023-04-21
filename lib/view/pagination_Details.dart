import 'package:flutter/material.dart';

class PaginatioN_2 extends StatefulWidget {
  const PaginatioN_2(this.name, this.description, this.id, {super.key});

  final String name;
  final String id;
  final String description;

  @override
  State<PaginatioN_2> createState() => _PaginatioN_2State();
}

class _PaginatioN_2State extends State<PaginatioN_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination_Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                maxRadius: 80,
                backgroundImage: NetworkImage(
                  widget.id.toString(),
                )),
            const SizedBox(height: 15),
            Text(
              "Title : ${widget.name.toString()}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Description : ${widget.description.toString()}",
            ),
          ],
        ),
      ),
    );
  }
}
