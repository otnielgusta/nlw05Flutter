import 'package:flutter/material.dart';
import 'package:nlwflutter/core/app_colors.dart';
import 'package:nlwflutter/core/app_text_styles.dart';

class ChartWidget extends StatelessWidget {
  final int score;

  const ChartWidget({
    Key? key,
    required this.score,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: score / 100,
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text(
              score.toString(),
              style: AppTextStyles.heading,
            ),
          ),
        ],
      ),
    );
  }
}
