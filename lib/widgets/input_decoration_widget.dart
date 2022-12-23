import 'package:fifth_exam/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration getInputDecoration({required String label}) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: AppColors.C_8E9090, fontSize: 16.sp),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.r),
      ),
      borderSide: const BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.black),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.black),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.black),
    ),
  );
}
