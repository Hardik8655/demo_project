import 'package:ankit/view/api_productmodel.dart';
import 'package:ankit/view/pagination_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/paginationModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ApiProductModel(),
    );
  }
}

class PaginationScree extends StatefulWidget {
  const PaginationScree({Key? key}) : super(key: key);

  @override
  State<PaginationScree> createState() => _PaginationScreeState();
}

class _PaginationScreeState extends State<PaginationScree> {
  int pageNo = 1;
  bool isApiLoading = true;
  bool isMoreData = true;
  ScrollController scrollController = ScrollController();
  List<PaginationModel> paginationLst = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isApiLoading && isMoreData) {
          getData();
        }
      }
    });
  }

  getData() async {
    isApiLoading = true;
    var response = await http.get(
        Uri.parse("https://api.punkapi.com/v2/beers?page=$pageNo&per_page=10"));
    if (response.statusCode == 200) {
      pageNo++;
      paginationLst.addAll(paginationModelFromJson(response.body));
      if (paginationModelFromJson(response.body).isEmpty) {
        isMoreData = false;
      }
      // Model model = Model.fromJson(jsonDecode(response.body));
      // Model model1 = modelFromJson(response.body);
      setState(() {
        isApiLoading = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pagination"),
      ),
      body: isApiLoading && paginationLst.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: paginationLst.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                            leading: const Icon(Icons.list),
                            title: Text(
                              paginationLst[index].name.toString(),
                            ),
                            subtitle: Text(paginationLst[index].description)),
                        isMoreData && (paginationLst.length - 1) == index
                            ? Center(child: CircularProgressIndicator())
                            : const SizedBox(),
                      ],
                    );
                  }),
            ),
    );
  }
}
