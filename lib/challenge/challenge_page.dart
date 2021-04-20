import 'package:flutter/material.dart';
import 'package:nlwflutter/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlwflutter/challenge/widgets/question_indicator/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: QuestionIndicatorWidget()),
      ),
      body: QuizWidget(
        title: "O que o Flutter faz em sua totalidade?",
      ),
    );
  }
}
