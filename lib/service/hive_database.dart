import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../model/cat_picture.dart';

class HiveService {
  static var objBox = Hive.box('History');
  static var allHistory = <History>[];

  ///Hive yordamida obj saqlash :date time now orqali key berish
  static storedObj({required var obj, required String objKey}) {
    String stringUserObj = jsonEncode(obj);
    objBox.put(objKey, stringUserObj);
    Logger().i("user info saved successfully");
  }

  ///Hamma History objni olish funksiyasi
  static List<History> getObj() {
    allHistory.clear();
    for (var key in objBox.keys) {
      String stringObj = objBox.get(key);
      Map<String, dynamic> map = jsonDecode(stringObj);
      History task = History.fromJson(map);
      allHistory.add(task);
    }

    return allHistory;
  }
}
