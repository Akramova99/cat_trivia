import 'dart:async';

import 'package:cat_trivia/pages/cat_picture.dart';
import 'package:cat_trivia/pages/history.dart';
import 'package:cat_trivia/pages/home_page.dart';
import 'package:cat_trivia/service/reprository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async{
  final CatFactRepository repository = CatFactRepository();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("History");
  runApp(MyApp(repository: repository));
}

class MyApp extends StatefulWidget {
  final CatFactRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        CatPicture.id: (context) => const CatPicture(),

        HistoryPage.id: (context) => const HistoryPage(),
      },
    );
  }
}
