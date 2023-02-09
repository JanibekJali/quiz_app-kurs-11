import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors/app_colors.dart';
import 'package:quiz_app/constants/text_style/app_text_style.dart';
import 'package:quiz_app/utilities/question_answers_util/quiz_list_util.dart';

const String tuuraTandoo = 'Tuura';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isQuiestionsFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        title: const Text('Quiz App'),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          if (isQuiestionsFinished == true)
            AlertDialog(
              title: const Text("Suroolor buttu"),
              actions: [
                TextButton(
                  child: const Text("Kaira bashta"),
                  onPressed: () {
                    isQuiestionsFinished == false;
                    setState(() {});

                    quizListUtil.suroonuAlipKel();
                    log('restart index ===> ${quizListUtil.indextiNulKil()}');
                    icons = [];

                    log('Kaira bashta');
                  },
                )
              ],
            )
          // showAlertDialog(context)
          // ElevatedButton(
          //   onPressed: () {
          // quizListUtil.restart();
          // log('restart index ===> ${quizListUtil.restart()}');

          // quizListUtil.suroonuAlipKel();
          // isQuiestionsFinished == false;
          // setState(() {});

          // log('Kaira bashta');
          //   },
          //   child: const Padding(
          //     padding: EdgeInsets.all(15.0),
          //     child: Text(
          //       'Kaira Bashta',
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                quizListUtil.suroonuAlipKel().toString(),
                textAlign: TextAlign.center,
                style: AppTextStyle.white40w600,
              ),
            ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  userdinJooby(true);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    child: Text(tuuraTandoo, style: AppTextStyle.white35w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  userdinJooby(false);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                    child: Text('Kata', style: AppTextStyle.white35w600),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: icons,
          )
        ]),
      ),
    );
  }

  void userdinJooby(bool userBasty) {
    bool tuuraJoop = quizListUtil.jooptuAlipKel();
    if (tuuraJoop == userBasty) {
      icons.add(tuuraIcon);
    } else if (tuuraJoop != userBasty) {
      icons.add(kataIcon);
    }
    quizListUtil.otkoz();
    if (quizListUtil.suroonuAlipKel() == '') {
      isQuiestionsFinished = true;
    }

    setState(() {});
  }

  List<Icon> icons = [];

  Icon tuuraIcon = const Icon(
    Icons.check,
    color: AppColors.green,
    size: 55,
  );

  Icon kataIcon = const Icon(
    Icons.close,
    color: AppColors.red,
    size: 55,
  );
}
