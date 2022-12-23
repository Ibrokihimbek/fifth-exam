import 'package:fifth_exam/screens/app_router.dart';
import 'package:fifth_exam/screens/home/widgets/eleveted_button_widget.dart';
import 'package:fifth_exam/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam 5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            elevetedButton(
              onTap: () {
                Navigator.pushNamed(context, RouteName.students);
              },
              buttonName: 'Firebase',
              buttonCollor: AppColors.C_FFC107,
            ),
            SizedBox(height: 50.h),
            elevetedButton(
              onTap: () {
                Navigator.pushNamed(context, RouteName.users);
              },
              buttonName: 'Dio',
              buttonCollor: AppColors.C_07FF6A,
            ),
            SizedBox(height: 50.h),
            elevetedButton(
              onTap: () {
                Navigator.pushNamed(context, RouteName.animation);
              },
              buttonName: 'Animations',
              buttonCollor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
