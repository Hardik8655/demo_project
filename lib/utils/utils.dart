import 'dart:convert';

import 'package:ankit/model/cartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Share_Pref

// class Utils {
//   static Future setLogin({required bool isLogin}) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('login', isLogin);
//   }
//
//   static Future removeLogin({required String key}) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(key);
//   }
//
//   static Future<bool> getLogin() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('login') ?? false;
//   }
//
//   static Future<CartModel?> getData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? data = prefs.getString('counter');
//     if (data == null) {
//       return null;
//     } else {
//       return CartModel.fromJson(jsonDecode(data));
//     }
//   }
//
//   static Future setData({required CartModel cartModel}) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('counter', jsonEncode(cartModel.toJson()));
//   }
//
//   static Future<CartModel?> getData1() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? data = prefs.getString('counter');
//     if (data == null) {
//       return null;
//     } else {
//       return CartModel.fromJson(jsonDecode(data));
//     }
//   }
// }

class SharedPrefService {
  // Add to Shared Pref
  addToSharedPref({required String key, required var value}) async {
    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();
    // Save a [String] value to given [key].
    await sharedPref.setString(key, value);
  }

  // Read From Shared Pref
  readFromSharedPref(String key, Type type) async {
    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();
    // Read a [String] value from given [key].
    return sharedPref.getString(key);
  }

  // Delete From Shared Pref
  deleteFromSharedPref(String key) async {
    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove(key);
  }

  // Update in Shared Pref
  updateDataInSharedPref({required String key, required var value}) async {
    // Shared Pref instanse
    var sharedPref = await SharedPreferences.getInstance();
    // Update a [String] value to given [key].
    await sharedPref.setString(key, value);
  }

// // Save Models to Shared Preferences
// saveModelToSharedPrefs(String key, UserModel userModel) async {
//   // Shared Pref instanse
//   var sharedPref = await SharedPreferences.getInstance();
//   // returns String value of given Model
//   String value = userModelToJson(userModel);
//   // and save it to Shared Prefs
//   await sharedPref.setString(key, value);
// }
//
// // Read Model from shared prefes
// readModelFromSharedPrefs(String key) async {
//   // Shared Pref instanse
//   var sharedPref = await SharedPreferences.getInstance();
//   String value = sharedPref.getString(key);
//
//   UserModel userModel = userModelFromJson(value);
//
//   return userModel;
// }
}
