import 'dart:convert';
import 'dart:math';

import 'package:ankit/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProductModel extends StatefulWidget {
  const ApiProductModel({Key? key}) : super(key: key);

  @override
  State<ApiProductModel> createState() => _ApiProductModelState();
}

class _ApiProductModelState extends State<ApiProductModel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  bool isApiLoading = true;
  ProductModel? productModel;

  getProduct() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(jsonDecode(response.body));
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
        title: const Text("API_PRODUCT_MODEL"),
      ),
      body: isApiLoading && productModel == null
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: productModel!.products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(productModel!
                                .products[index].thumbnail
                                .toString())),
                        title: Text(
                            "Title : ${productModel!.products[index].title.toString()}"),
                        subtitle: Text(productModel!.products[index].description
                            .toString()),
                        trailing: Text(
                            productModel!.products[index].price.toString()),
                      );
                    }),
              )
            ]),
    );
  }
}
