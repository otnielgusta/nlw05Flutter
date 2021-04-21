import 'package:flutter/material.dart';
import 'package:nlwflutter/core/app_gradients.dart';
import 'package:nlwflutter/core/app_text_styles.dart';
import 'package:nlwflutter/home/widgets/score_card/score_card_widget.dart';
import 'package:nlwflutter/shared/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  final UserModel userModel;
  AppBarWidget({required this.userModel})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            width: double.maxFinite,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 161,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: userModel.name,
                                style: AppTextStyles.titleBold,
                              )
                            ]),
                      ),
                      Container(
                        width: 58,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              userModel.photoUrl,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment(0.0, 1.0),
                    child: ScoreCardWidget(
                      score: userModel.score,
                    )),
              ],
            ),
          ),
        );
}
