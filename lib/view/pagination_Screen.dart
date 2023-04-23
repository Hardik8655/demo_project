import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/paginationModel.dart';

// class PaginationScreen extends StatefulWidget {
//   const PaginationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PaginationScreen> createState() => _PaginationScreenState();
// }
//
// class _PaginationScreenState extends State<PaginationScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pagination();
//
//     scrollController.addListener(() {
//       if (scrollController.position.pixels ==
//           scrollController.position.maxScrollExtent) {
//         if (!isApiLoading && isMoreData) {
//           pagination();
//         }
//       }
//     });
//   }
//
//   TextEditingController searchController = TextEditingController();
//
//   // pagination variable
//   int pageNo = 1;
//   bool isApiLoading = true;
//   bool isMoreData = true;
//   ScrollController scrollController = ScrollController();
//   List<PaginationModel> paginationList = [];
//
//   // Search variable
//   List<PaginationModel> searchData = [];
//
//   // save and toggle
//   // List<bool> temp = [];
//   SharedPreferences? pref;
//
//   // Future<void> Get_Data() async {
//   //   pref = await SharedPreferences.getInstance();
//   //
//   //   for (int i = 0; i < temp.length; i++) {
//   //     temp[i] = pref!.getBool("Like$i") ?? false;
//   //
//   //   }
//   // }
//
//   pagination() async {
//     isApiLoading = true;
//     var response = await http.get(
//         Uri.parse("https://api.punkapi.com/v2/beers?page=$pageNo&per_page=10"));
//     if (response.statusCode == 200) {
//       pageNo++;
//       paginationList.addAll(paginationModelFromJson(response.body));
//       if (paginationModelFromJson(response.body).isEmpty) {
//         isMoreData = false;
//       }
//       setState(() {
//         isApiLoading = false;
//       });
//     } else {
//       print(e.toString());
//     }
//     // for list view search
//     searchData = paginationList;
//     likeList = pref?.getStringList("like") ?? [];
//     // temp = List.filled(searchData.length, false);
//     // save
//     // Get_Data();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: isApiLoading && paginationList.isEmpty
//             ? const Center(child: CircularProgressIndicator())
//             : Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 8, left: 8, right: 8, bottom: 8),
//                     child: TextField(
//                       // onChanged: (value) {
//                       //   paginationList = searchData
//                       //       .where((element) =>
//                       //           element.name.toString().contains(value))
//                       //       .toList();
//                       //
//                       //   setState(() {});
//                       // },
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           hintText: "Search...",
//                           suffixIcon: const Icon(Icons.search),
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 15)),
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                         controller: scrollController,
//                         itemCount: paginationList.length,
//                         itemBuilder: (context, index) {
//                           //text editing
//                           if (paginationList[index]
//                               .name
//                               .contains(scrollController.toString())) {
//                             return Column(children: [
//                               ListTile(
//                                 title:
//                                     Text(paginationList[index].name.toString()),
//                                 subtitle: Text(
//                                     paginationList[index]
//                                         .description
//                                         .toString(),
//                                     maxLines: 1),
//                                 trailing: IconButton(
//                                     onPressed: () {
//                                       if (likeList.contains(
//                                           paginationList[index]
//                                               .id
//                                               .toString())) {
//                                         int deletedIndex = likeList.indexOf(
//                                             paginationList[index]
//                                                 .id
//                                                 .toString());
//                                         likeList.removeAt(deletedIndex);
//                                       } else {
//                                         likeList.add(paginationList[index]
//                                             .id
//                                             .toString());
//                                       }
//                                       pref!.setStringList("like", likeList);
//                                       // temp[index] = !temp[index];
//                                       // pref!.setBool("Like$index", temp[index]);
//                                       setState(() {});
//                                     },
//                                     icon: likeList.contains(
//                                             paginationList[index]
//                                                 .id
//                                                 .toString()) //temp[index]
//                                         ? const Icon(
//                                             Icons.favorite,
//                                             size: 30,
//                                             color: Colors.red,
//                                           )
//                                         : const Icon(
//                                             Icons.favorite_border,
//                                             size: 30,
//                                           )),
//                                 onTap: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => PaginatioN_2(
//                                               paginationList[index]
//                                                   .name
//                                                   .toString(),
//                                               paginationList[index]
//                                                   .description
//                                                   .toString(),
//                                               paginationList[index]
//                                                   .id
//                                                   .toString(),
//                                             ))),
//                               ),
//                               isMoreData && (paginationList.length - 1 == index)
//                                   ? const Center(
//                                       child: CircularProgressIndicator())
//                                   : const SizedBox(),
//                               !isMoreData &&
//                                       (paginationList.length - 1 == index)
//                                   ? const Padding(
//                                       padding: EdgeInsets.all(50.0),
//                                       child: Text("NO MORE DATA"),
//                                     )
//                                   : const SizedBox()
//                             ]);
//                           }
//                           return const SizedBox();
//                         }),
//                   )
//                 ],
//               ),
//       ),
//     );
//   }
//
//   List<String> likeList = [];
// }

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({Key? key}) : super(key: key);

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pagination();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isApiLoading && isMoreData) {
          pagination();
        }
      }
    });
  }

  // variable for pagination
  int pageNo = 1;
  bool isApiLoading = true;
  bool isMoreData = true;
  ScrollController scrollController = ScrollController();
  List<PaginationModel> paginationList = [];

  // variable for like
  List<String> likeList = [];
  SharedPreferences? pref;



  TextEditingController searchController = TextEditingController();

  pagination() async {
    isApiLoading = true;
    var response = await http.get(
        Uri.parse("https://api.punkapi.com/v2/beers?page=$pageNo&per_page=10"));
    if (response.statusCode == 200) {
      pageNo++;
      paginationList.addAll(paginationModelFromJson(response.body));
      if (paginationModelFromJson(response.body).isEmpty) {
        isMoreData = false;
      }
      setState(() {
        isApiLoading = false;
      });
    } else {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination"),
      ),
      body: isApiLoading && paginationList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Search...",
                      suffixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: paginationList.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          ListTile(
                            title: Text(paginationList[index].name.toString()),
                            subtitle: Text(
                                paginationList[index].description.toString(),
                                maxLines: 1),
                            trailing: IconButton(
                                onPressed: () {
                                  if (likeList.contains(
                                      paginationList[index].id.toString())) {
                                    int deletedIndex = likeList.indexOf(
                                        paginationList[index].id.toString());
                                    likeList.removeAt(deletedIndex);
                                  } else {
                                    likeList.add(
                                        paginationList[index].id.toString());
                                  }
                                  pref?.setStringList("like", likeList);
                                  // temp[index] = !temp[index];
                                  // pref!.setBool("Like$index", temp[index]);
                                  likeList = pref?.getStringList("like") ?? [];
                                  setState(() {});
                                },
                                icon: likeList.contains(paginationList[index]
                                        .id
                                        .toString()) //temp[index]
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 30,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        size: 30,
                                      )),
                          ),
                          isMoreData && (paginationList.length - 1 == index)
                              ? const Center(child: CircularProgressIndicator())
                              : const SizedBox(),
                          !isMoreData && (paginationList.length - 1 == index)
                              ? const Center(child: Text("NO MORE DATA"))
                              : const SizedBox(),
                        ]);
                      }),
                ),
              ],
            ),
    );
  }
}

// if (paginationList[index]
//     .name
//     .contains(searchController.toString()))