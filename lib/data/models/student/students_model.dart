class StudentsModel {

  String studentId;
  String studentName;
  String imageUrl;


  StudentsModel({
    required this.studentName,
    required this.studentId,
    required this.imageUrl,
  });

  factory StudentsModel.fromJson(Map<String, dynamic> jsonData) {
    return StudentsModel(
      studentName: jsonData['studentName'] as String? ?? '',
      studentId: jsonData['studentId'] as String? ?? '',
      imageUrl: jsonData['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentName': studentName,
      'studentId': studentId,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return ''''
       studentName : $studentName,
       studentId : $studentId,
       imageUrl : $imageUrl,
      ''';
  }

  StudentsModel copyWith({
    String? studentName,
    String? studentId,
    String? description,
    String? imageUrl,
    String? createdAt,
  }) =>
      StudentsModel(
        studentName: studentName ?? this.studentName,
        studentId: studentId ?? this.studentId,
        imageUrl: imageUrl ?? this.imageUrl,
      );
}
