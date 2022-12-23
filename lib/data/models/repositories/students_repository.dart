import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifth_exam/data/models/student/students_model.dart';
import 'package:fifth_exam/widgets/toast_widget.dart';

class StudentRepository {
  final FirebaseFirestore _firestore;
  StudentRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addStudent({required StudentsModel studentsModel}) async {
    try {
      DocumentReference newStudent =
          await _firestore.collection("students").add(studentsModel.toJson());
      await _firestore
          .collection("students")
          .doc(newStudent.id)
          .update({"studentId": newStudent.id});
      getMyToast(message: 'Talaba muvaffaqiyatli saqlandi');
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  Future<void> deleteStudent({required String docId}) async {
    try {
      await _firestore.collection("students").doc(docId).delete();
      getMyToast(message: "Talaba muvaffaqiyatli o'chirildi");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  Future<void> updateStudentInfo({required StudentsModel studentsModel}) async {
    try {
      await _firestore
          .collection("students")
          .doc(studentsModel.studentId)
          .update(studentsModel.toJson());
          getMyToast(message: "Talabaning ma'lumotlari muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (e) {
      getMyToast(message: e.message.toString());
    }
  }

  Stream<List<StudentsModel>> getAllStudent() => _firestore
      .collection("students")
      .snapshots()
      .map((querySnapshot) => querySnapshot.docs
          .map((e) => StudentsModel.fromJson(e.data()))
          .toList());
}
