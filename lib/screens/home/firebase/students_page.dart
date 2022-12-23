import 'package:fifth_exam/data/models/student/students_model.dart';
import 'package:fifth_exam/screens/app_router.dart';
import 'package:fifth_exam/screens/home/widgets/eleveted_button_widget.dart';
import 'package:fifth_exam/utils/app_colors.dart';
import 'package:fifth_exam/view_model/students_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Consumer<StudentsViewModel>(
        builder: ((context, studentViewModel, child) {
          return Column(
            children: [
              SizedBox(
                height: 650.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: studentViewModel.students.length,
                  itemBuilder: (context, index) {
                    return studentItem(
                      studentViewModel.students[index],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12).r,
                child: elevetedButton(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.addStudent);
                    },
                    buttonName: 'Add Student',
                    buttonCollor: AppColors.white),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget studentItem(StudentsModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6).r,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.C_8E9090,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.7),
              blurRadius: 4,
              offset: const Offset(6, 6),
            ),
          ],
        ),
        width: double.infinity,
        height: 100.h,
        child: Row(
          children: [
            SizedBox(width: 8.w),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: NetworkImage(model.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              width: 80.w,
              height: 80.h,
            ),
            SizedBox(width: 12.w),
            SizedBox(
              width: 150.w,
              child: Text(
                model.studentName,
                style: const TextStyle(color: AppColors.black),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.updateStudentInfo,
                    arguments: {'studentItem': model});
              },
              child: const Icon(
                Icons.edit,
                color: AppColors.black,
                size: 28,
              ),
            ),
            SizedBox(width: 22.w),
            InkWell(
              onTap: () {
                Provider.of<StudentsViewModel>(
                  context,
                  listen: false,
                ).deleteStudent(model.studentId);
              },
              child: const Icon(
                Icons.delete,
                color: AppColors.black,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
