import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';
import 'package:wework_app/app/core/theme/app_text_style.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final EdgeInsets? linePadding;
  final EdgeInsetsGeometry? outerPadding;

  final bool isTextLeftAligned;

  const HeadingText({
    super.key,
    this.linePadding,
    required this.text,
    // this.lineHeight = 2,
    this.outerPadding,
    this.isTextLeftAligned = true,
  });

  static TextStyle get textStyle =>
      AppTextStyle.h5Bold(color: AppColors.gray03);

  @override
  Widget build(BuildContext context) {
    // margin: const EdgeInsets.symmetric(vertical: 16),

    return Padding(
      padding: outerPadding ?? EdgeInsets.zero,
      child: Row(children: [
        // SvgPicture.asset(
        //   AppAssets.icMenu,
        //   color: AppColors.primaryColor,
        // ),

        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              Text(
                text,
                style: textStyle,
              ),
            ],
          ),
        ),

        Expanded(
            child: Padding(
          padding: linePadding ?? const EdgeInsets.all(0),
          child: Container(
            height: .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: const LinearGradient(
                colors: [AppColors.black0, Colors.transparent],
              ),
            ),
          ),
        )),
      ]),
    );
  }
}
