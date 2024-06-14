import 'dart:math';

import 'package:cat_trivia/controller/save_history.dart';
import 'package:cat_trivia/model/cat_facts.dart';
import 'package:cat_trivia/pages/history.dart';
import 'package:cat_trivia/service/hive_database.dart';
import 'package:flutter/material.dart';

import '../model/cat_picture.dart';
import '../service/net_service.dart';

class CatPicture extends StatefulWidget {
  static const String id = "CatPicture";

  const CatPicture({super.key});

  @override
  State<CatPicture> createState() => _CatPictureState();
}

class _CatPictureState extends State<CatPicture> {
  Cat? randomFact;
  List<Cat> facts = [];

  void getRandomFact() async {
    var response = await NetworkService.GET_LESSON_METHOD({});
    setState(() {
      facts = NetworkService.parsingResponse(response!);
      if (facts.isNotEmpty) {
        randomFact = facts[Random().nextInt(facts.length)];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getRandomFact();
  }

  @override
  Widget build(BuildContext context) {
    if (randomFact == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    DateTime time = randomFact!.createdAt;
    String date = "Create date:  ${time.year}-${time.month}-${time.day}";
    String path =
        "https://cataas.com/cat?${DateTime.now().millisecondsSinceEpoch}";

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/img.jpg"),
          ),
        ),
        child: SingleChildScrollView(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      path,
                    )),
              ),
              Container(
                //height: 200,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              randomFact!.text,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Text(
                          date,
                          style: const TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, HistoryPage.id);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            height: 50.0,
                            width: 150,
                            decoration: BoxDecoration(
                              color: const Color(0xff4147D5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "History", // Clearer button text
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                )),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  SaveHistory.saveHistory(
                      fact: randomFact!.text, createDate: date, path: path);
                  History obj = History(
                      fact: randomFact!.text, createDate: date, path: path);
                  HiveService.storedObj(
                      obj: obj, objKey: DateTime.now().toString());
                  getRandomFact();
                  // Fetch a new random fact on tap
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 50.0,
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xff4147D5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Another Fact", // Clearer button text
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
