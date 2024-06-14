


import 'package:cat_trivia/model/cat_picture.dart';
import 'package:cat_trivia/service/hive_database.dart';
import 'package:logger/logger.dart';

class SaveHistory {
  static saveHistory({required String fact, required String createDate , required String path }){
    History obj= History(fact: fact, createDate: createDate, path: path) ;
    HiveService.storedObj(obj: obj, objKey: DateTime.now().toString());


  }

}