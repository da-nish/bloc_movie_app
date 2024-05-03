import 'package:flutter/material.dart';
import 'package:wework_app/app/core/theme/app_assets.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';
import 'package:wework_app/app/core/theme/app_text_style.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.noData,
          width: 180,
          height: 180,
        ),
        Text(
          "No Records",
          style: AppTextStyle.h3Regular(color: AppColors.gray03),
        )
      ],
    );
  }
}
