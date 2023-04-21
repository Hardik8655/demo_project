import 'dart:convert';
import 'dart:math';

import 'package:ankit/model/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCallCartModel extends StatefulWidget {
  const ApiCallCartModel({Key? key}) : super(key: key);

  @override
  State<ApiCallCartModel> createState() => _ApiCallCartModelState();
}

class _ApiCallCartModelState extends State<ApiCallCartModel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCart();
  }

  bool isApiLoading = true;
  CartModel? cartModel;

  getCart() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/carts"));
    if (response.statusCode == 200) {
      cartModel = CartModel.fromJson(jsonDecode(response.body));
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
        title: const Text("CART_MODEL_API_CALL"),
      ),
      body: isApiLoading && cartModel == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartModel!.carts.length,
                      itemBuilder: (context, index1) {
                        return Column(children: [
                          ListTile(
                            leading: Text(
                                cartModel!.carts[index1].userId.toString()),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  cartModel!.carts[index1].products.length,
                              itemBuilder: (context, index2) {
                                return ListTile(
                                  trailing: Text(cartModel!
                                      .carts[index1].products[index2].total
                                      .toString()),
                                );
                              }),
                        ]);
                      }),
                ),
              ],
            ),
    );
  }
}
