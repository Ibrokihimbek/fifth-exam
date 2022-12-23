import 'package:fifth_exam/data/models/repositories/users_repository.dart';
import 'package:fifth_exam/data/models/users/users_model.dart';
import 'package:fifth_exam/data/services/api/api_service.dart';
import 'package:fifth_exam/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersViewModel(
        usersRepository: UsersRepository(apiService: ApiService()),
      ),
      builder: (context, child) {
        var viewModel = context.watch<UsersViewModel>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Users'),
          ),
          body: viewModel.errorForUI.isNotEmpty
              ? Center(
                  child: Text(viewModel.errorForUI),
                )
              : viewModel.users != null
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: viewModel.users!.length,
                      itemBuilder: (context, index) {
                        return usersItem(viewModel.users![index]);
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        );
      },
    );
  }

  Widget usersItem(
    UsersModel users,
  ) {
    return ListTile(
      leading: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(users.avatarUrl), fit: BoxFit.cover),
        ),
      ),
      title: Text(users.username),
      subtitle: Text(users.name),
    );
  }
}
