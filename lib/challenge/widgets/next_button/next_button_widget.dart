import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nlwflutter/core/app_colors.dart';
import 'package:nlwflutter/core/app_widget.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onTap = onTap,
        this.overlayColor = Colors.green.shade400,
        this.label = label;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.purple,
        this.onTap = onTap,
        this.overlayColor = Colors.purple.shade900,
        this.label = label;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.lightGrey,
        this.borderColor = AppColors.border,
        this.onTap = onTap,
        this.overlayColor = Colors.grey.shade200,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(overlayColor),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: borderColor,
              ),
            )),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),
        ),
      ),
    );
  }
}
