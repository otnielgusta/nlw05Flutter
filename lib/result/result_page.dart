import 'package:flutter/material.dart';
import 'package:nlwflutter/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlwflutter/core/app_images.dart';
import 'package:nlwflutter/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage(
      {Key? key,
      required this.title,
      required this.length,
      required this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(AppImages.trophy),
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n${title}",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                          text: "\ncom $result de $length acertos",
                          style: AppTextStyles.body),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [
                      Expanded(
                          child: NextButtonWidget.purple(
                              label: "Compartilhar",
                              onTap: () {
                                double porcent = (result * 100) / length;
                                Share.share(
                                    'DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive: ${porcent.toStringAsPrecision(2)}% de aproveitamento');
                              })),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [
                      Expanded(
                          child: NextButtonWidget.white(
                              label: "Voltar ao Inicio",
                              onTap: () {
                                Navigator.pop(context);
                              })),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
