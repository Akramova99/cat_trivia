import 'package:cat_trivia/model/cat_picture.dart';
import 'package:flutter/material.dart';

class HistoryBox extends StatelessWidget {
  final History history;

  const HistoryBox({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 20,
        ),

        Container(
          //height: 200,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                        width: 260,
                        height: 300,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          history.path!,
                        )),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      history.fact!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    history.createDate!,
                    style: const TextStyle(fontSize: 20),
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
      ],
    );
  }
}
