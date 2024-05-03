import 'package:flutter/material.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';
import 'package:wework_app/app/core/theme/app_text_style.dart';

mixin AppCommonStyle {
  //it is similar to: AppTextStyle.h3SemiBold();

  static TextStyle bottomsheetTextTitleStyle =
      AppTextStyle.h3SemiBold(color: AppColors.black0);
}
