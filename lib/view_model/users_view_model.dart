import 'package:fifth_exam/data/models/my_response/response_model.dart';
import 'package:fifth_exam/data/models/repositories/users_repository.dart';
import 'package:fifth_exam/data/models/users/users_model.dart';
import 'package:flutter/cupertino.dart';

class UsersViewModel extends ChangeNotifier {
  UsersRepository usersRepository;
  UsersViewModel({required this.usersRepository}) {
    fetchUserInfo();
  }

  bool isLoading = false;
  List<UsersModel>? users;
  String errorForUI = "";

  fetchUserInfo() async {
    MyResponse myResponse = await usersRepository.getAllUsers();
    if (myResponse.error.isEmpty) {
      users = myResponse.data as List<UsersModel>;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }
}
