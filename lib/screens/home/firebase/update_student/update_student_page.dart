import 'package:fifth_exam/data/models/student/students_model.dart';
import 'package:fifth_exam/data/services/uploader/file_uploader.dart';
import 'package:fifth_exam/screens/home/widgets/eleveted_button_widget.dart';
import 'package:fifth_exam/utils/app_colors.dart';
import 'package:fifth_exam/view_model/students_view_model.dart';
import 'package:fifth_exam/widgets/input_decoration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UpdateStudentPage extends StatefulWidget {
  final StudentsModel studentsModel;
  const UpdateStudentPage({super.key, required this.studentsModel});

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController updateStudentInfoCantroller =
      TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    updateStudentInfoCantroller.text = widget.studentsModel.studentName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student Info'),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Consumer<StudentsViewModel>(
            builder: ((context, categoryViewModel, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      'Talaba ismi yangilash',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: updateStudentInfoCantroller,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (category) =>
                          category != null && category.length < 2
                              ? "Talaba ismini 2 ta belgidan ko'p kiriting"
                              : null,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14.sp,
                      ),
                      decoration: getInputDecoration(label: ''),
                    ),
                    SizedBox(height: 24.h),
                    elevetedButton(
                      onTap: () {
                        _showPicker(context);
                      },
                      buttonName: 'Update Student Image',
                      buttonCollor: AppColors.white,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Image.network(
                        widget.studentsModel.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    elevetedButton(
                      onTap: () {
                        StudentsModel studentsModel = StudentsModel(
                          studentName: updateStudentInfoCantroller.text,
                          studentId: widget.studentsModel.studentId,
                          imageUrl: widget.studentsModel.imageUrl,
                        );

                        Provider.of<StudentsViewModel>(context, listen: false)
                            .updateStudent(studentsModel);
                        Navigator.pop(context);
                      },
                      buttonName: 'Update Student Info',
                      buttonCollor: AppColors.white,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text("Gallery"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1000,
      maxHeight: 1000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      widget.studentsModel.imageUrl =
          await FileUploader.imageUploader(pickedFile, 'categoryImages');
      setState(() {});
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      widget.studentsModel.imageUrl =
          await FileUploader.imageUploader(pickedFile, 'categoryImages');
      setState(() {});
    }
  }
}
