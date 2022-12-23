import 'dart:async';

import 'package:fifth_exam/data/models/repositories/students_repository.dart';
import 'package:fifth_exam/data/models/student/students_model.dart';
import 'package:flutter/material.dart';

class StudentsViewModel extends ChangeNotifier {
  final StudentRepository studentRepository;
  StudentsViewModel({required this.studentRepository}) {
    listenStudents();
  }

  late StreamSubscription subscription;

  List<StudentsModel> students = [];

  listenStudents() async {
    subscription = studentRepository.getAllStudent().listen((allStudents) {
      students = allStudents;
      notifyListeners();
    });
  }

  addStudent(StudentsModel studentsModel) =>
      studentRepository.addStudent(studentsModel: studentsModel);

  updateStudent(StudentsModel studentsModel) =>
      studentRepository.updateStudentInfo(studentsModel: studentsModel);

  deleteStudent(String docId) => studentRepository.deleteStudent(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
