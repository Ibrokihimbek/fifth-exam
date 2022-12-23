import 'package:fifth_exam/screens/home/animation/paint_widget.dart';
import 'package:fifth_exam/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    Color colors = AppColors.C_8E9090;

    Future.delayed(const Duration(seconds: 2)).then(
      (value) => colors = AppColors.C_07FF6A,
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(!isChange ? 'Animation' : 'Custom Paint'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isChange = !isChange;
              });
            },
            icon: const Icon(
              Icons.change_circle,
            ),
          ),
        ],
      ),
      body: !isChange
          ? Center(
              child: TweenAnimationBuilder<double>(
                builder: (BuildContext context, value, Widget? child) {
                  return Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 8.w,
                            backgroundColor: AppColors.C_8E9090,
                            color: AppColors.C_07FF6A,
                            value: value,
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.done,
                          color: colors,
                          size: 80,
                        ),
                      ),
                    ],
                  );
                },
                tween: Tween<double>(begin: 0.0, end: 3),
                duration: const Duration(milliseconds: 6000),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 500.h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.C_07FF6A,
                            AppColors.C_7DF5AD,
                          ],
                        ),
                      ),
                      child: CustomPaint(
                        size: const Size(500, 400),
                        painter: MyPainter(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
