import 'package:flutter/material.dart';
import 'package:nlwflutter/challenge/challenge_controller.dart';

import 'package:nlwflutter/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlwflutter/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlwflutter/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlwflutter/result/result_page.dart';
import 'package:nlwflutter/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAnswerRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                currentPage: value,
                length: widget.questions.length,
              ),
            ),
          ],
        )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onSelected: onSelected,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20, bottom: 10),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (value < widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.white(
                              onTap: nextPage,
                              label: "Pular",
                            ),
                          ),
                        if (value == widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.green(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                      result: controller.qtdAnswerRight,
                                      length: widget.questions.length,
                                      title: widget.title,
                                    ),
                                  ),
                                );
                              },
                              label: "Confirmar",
                            ),
                          ),
                      ],
                    ))),
      ),
    );
  }
}
