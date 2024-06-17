import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_string.dart';

class SnackInfo {
  static void showSnack(BuildContext context) {
    const snackInfo = SnackBar(
      content: Text(AppString.snackText),
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.snackColor,
      width: 173,
      padding: EdgeInsets.all(24),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackInfo);
  }
}
