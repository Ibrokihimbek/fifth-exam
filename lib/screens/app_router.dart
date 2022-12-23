import 'package:fifth_exam/screens/home/animation/animation_page.dart';
import 'package:fifth_exam/screens/home/dio/users_page.dart';
import 'package:fifth_exam/screens/home/firebase/add_student/add_student_page.dart';
import 'package:fifth_exam/screens/home/firebase/students_page.dart';
import 'package:fifth_exam/screens/home/firebase/update_student/update_student_page.dart';
import 'package:fifth_exam/screens/home/home_page.dart';
import 'package:flutter/material.dart';

abstract class RouteName {
  static const home = 'home';
  static const users = 'users';
  static const students = 'students';
  static const addStudent = 'addStudent';
  static const updateStudentInfo = 'updateStudentInfo';
  static const animation = 'animation';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteName.users:
        return MaterialPageRoute(builder: (_) => UsersPage());
      case RouteName.students:
        return MaterialPageRoute(builder: (_) => StudentsPage());
      case RouteName.addStudent:
        return MaterialPageRoute(builder: (_) => AddStudentPage());
      case RouteName.updateStudentInfo:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => UpdateStudentPage(
            studentsModel: args['studentItem'],
          ),
        );
      case RouteName.animation:
        return MaterialPageRoute(builder: (_) => AnimationPage());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
