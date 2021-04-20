import 'package:flutter/material.dart';
import 'package:nlwflutter/challenge/widgets/answer/answer_widget.dart';
import 'package:nlwflutter/core/app_text_styles.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title:
                "Prossibilita a criação de aplicativos compilados nativamente",
          ),
          AnswerWidget(
            title:
                "Prossibilita a criação de aplicativos compilados nativamente",
          ),
          AnswerWidget(
            title:
                "Prossibilita a criação de aplicativos compilados nativamente",
          ),
          AnswerWidget(
            title:
                "Prossibilita a criação de aplicativos compilados nativamente",
          ),
        ],
      ),
    );
  }
}
