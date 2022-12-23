import 'package:fifth_exam/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget elevetedButton({required VoidCallback onTap, required String buttonName, required Color buttonCollor}) {
  return ElevatedButton(
    onPressed: onTap,
    child: Text(
      buttonName,
      style: TextStyle(
        color: buttonCollor,
        fontSize: 22.sp,
      ),
    ),
  );
}
