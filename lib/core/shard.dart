import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/langauge_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? sharedpreferences;
  static init() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> PutData({bool? value, String? key}) async {
    return await sharedpreferences?.setBool(key!, value!);
  }

  static Future<bool?> PutListOfString({
    String? key,
    List<String>? value,
  }) async {
    return await sharedpreferences?.setStringList(key!, value!);
  }

  static dynamic getData({String? key}) {
    return sharedpreferences?.get(key!);
  }

  static dynamic getListOfString({String? key}) {
    return sharedpreferences?.getStringList(key!);
  }

  static Future<bool?> SaveData(
      {required dynamic value, required String? key}) async {
    if (value is bool) return await sharedpreferences?.setBool(key!, value);
    if (value is int) return await sharedpreferences?.setInt(key!, value);
    if (value is String) return await sharedpreferences?.setString(key!, value);
    return await sharedpreferences?.setDouble(key!, value!);
  }

  static Future<bool?> removeData({required String? key}) async {
    return await sharedpreferences?.remove(key!);
  }

  static Future<String> getAppLanguage() async {
    String? language = CachHelper.getData(key: 'lang');
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  static Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }
}
