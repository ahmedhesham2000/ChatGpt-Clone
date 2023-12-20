import 'package:chatgpt_clone/core/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: AppColors.greenColor,

        textTheme: Typography.englishLike2021
            .apply(fontSizeFactor: 1, displayColor: Colors.white));
  }
}
