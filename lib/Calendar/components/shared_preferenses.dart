import 'dart:convert';
// import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MySharedPreferences {
  MySharedPreferences._privateConstructor();

  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  setStringValue(String key, String value) async {
    SharedPreferences myPrefs = await _prefs;
    myPrefs.setString(key, value);
  }

  Future<String> getStringValue(String key) async {
    SharedPreferences myPrefs = await _prefs;
    return myPrefs.getString(key) ?? "";
  }

  setIntegerValue(String key, int value) async {
    SharedPreferences myPrefs = await _prefs;
    myPrefs.setInt(key, value);
  }

  Future<int> getIntegerValue(String key) async {
    SharedPreferences myPrefs = await _prefs;
    return myPrefs.getInt(key) ?? 0;
  }

  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await _prefs;
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await _prefs;
    return myPrefs.getBool(key) ?? false;
  }

  Future<bool> containsKey(String key) async {
    SharedPreferences myPrefs = await _prefs;
    return myPrefs.containsKey(key);
  }

  setStringList(String key, List<String> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, list);
  }

  Future<List<String>> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getStringList(key);
  }

  removeValue(String key) async {
    SharedPreferences myPrefs = await _prefs;
    return myPrefs.remove(key);
  }

  removeAll() async {
    SharedPreferences myPrefs = await _prefs;
    return myPrefs.clear();
  }

  // SharedPreferences sharedPreferences = context.getSharedPreferences("calenderFile", Context.MODE_PRIVATE);
  // SharedPreferences.Editor editor = sharedPreferences.edit();
  // List<your object> list = new ArrayList<>();
}

// void saveListInLocal(List<dynamic> list, String key) {
//   SharedPreferences prefs =
//       PreferenceManager.getDefaultSharedPreferences(activity);
//   SharedPreferences.Editor editor = prefs.edit();
//   Gson gson = new Gson();
//   String json = gson.toJson(list);
//   editor.putString(key, json);
//   editor.apply();
// }
