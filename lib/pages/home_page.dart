import 'package:cat_trivia/model/cat_facts.dart';
import 'package:cat_trivia/pages/cat_picture.dart';
import 'package:flutter/material.dart';

import '../service/net_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cat> facts = [];

  void parsingResponse() async {
    var response = await NetworkService.GET_LESSON_METHOD({});

    setState(() {
      facts = NetworkService.parsingResponse(response!);
    });
    print("After: ______________________________________${facts[0].id}");
  }

  @override
  void initState() {
    super.initState();
    parsingResponse();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<FactsBloc>().add(FetchFacts());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/img.jpg"),
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: facts.isNotEmpty
                        ? Column(
                            children: [

                              Text(
                                facts.first.text,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Create date:  ${facts.first.createdAt}",
                                style: const TextStyle(fontSize: 20),
                              ),

                            ],
                          )
                        : CircularProgressIndicator(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, CatPicture.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                          "Other Fact",
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
          ),
        ),
      ),
    );
  }
}
