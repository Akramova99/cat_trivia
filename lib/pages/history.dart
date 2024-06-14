import 'package:cat_trivia/pages/cat_picture.dart';
import 'package:cat_trivia/widget/history_box.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../model/cat_picture.dart';
import '../service/hive_database.dart';

class HistoryPage extends StatefulWidget {
  static const String id = "HistoryPage";

  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<History> history = [];

  void getHistory() {
    setState(() {
      history = HiveService.getObj();
    });
    Logger().i(history.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:     IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, CatPicture.id);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Color(0xff1232443),
        title: const Text(
          "Back",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/img.jpg"),
            ),
          ),
          child: ListView.builder(
            itemCount: history.length,
              itemBuilder: (context, index) =>
                  HistoryBox(history: history[index]))),
    );
  }
}
