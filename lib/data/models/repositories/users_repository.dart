import 'package:fifth_exam/data/models/my_response/response_model.dart';
import 'package:fifth_exam/data/services/api/api_service.dart';

class UsersRepository {
  ApiService apiService;
  UsersRepository({required this.apiService});

  Future<MyResponse> getAllUsers() => apiService.getAllUsers();
}
