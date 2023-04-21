import 'dart:convert';

import 'package:ankit/model/cartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Utils{

  static Future setLogin({required bool isLogin})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', isLogin);
  }

  static Future removeLogin({required String key})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<bool> getLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('login') ?? false;
  }

  static Future<CartModel?> getData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('counter');
    if(data==null){
      return null;
    }else{
      return CartModel.fromJson(jsonDecode(data));
    }
  }

  static Future setData({required CartModel cartModel})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('counter', jsonEncode(cartModel.toJson()));
  }

  static Future<CartModel?> getData1()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('counter');
    if(data==null){
      return null;
    }else{
      return CartModel.fromJson(jsonDecode(data));
    }
  }

}