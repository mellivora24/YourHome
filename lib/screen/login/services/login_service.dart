import 'package:flutter/src/widgets/framework.dart';
import 'package:yourhome_web/screen/login/services/login_interface.dart';
import 'package:yourhome_web/service/api_service/api_service.dart';
import 'package:yourhome_web/service/api_service/request/login_request.dart';
import 'package:yourhome_web/service/api_service/response/base_response.dart';
import 'package:yourhome_web/service/api_service/response/login_response.dart';
import 'package:yourhome_web/utils/core/helpers/local_storage_helper.dart';

class LoginService implements ILoginInterface{
  final ApiServices apiServices = ApiServices();

  @override
  Future<bool> login({required String username, required String password}) async {
    LoginRequest request = LoginRequest(
      email: username,
      password: password,
    );
    final BaseResponse<LoginResponse> response = await apiServices.sendLogin(request);

    if (response.code != null) {
      for (var item in response.data!) {
        if (item.key == 'token'){
          LocalStorageHelper.setValue("authToken", item.value);
          print("da luu token: ${LocalStorageHelper.getValue('authToken')}");
        }

        if (item.key == 'user' && item.value is Map<String, dynamic>) {
          Map<String, dynamic> userMap = item.value as Map<String, dynamic>;
          String username = userMap['username'] ?? 'Nguyễn Minh Đức';
          String email = userMap['email'] ?? 'ngminhduc1603@gmail.com';
          int id = userMap['id'] ?? 1;
          LocalStorageHelper.setValue("userName", username);
          LocalStorageHelper.setValue("email", email);
          LocalStorageHelper.setValue("userId", id);

          break; // Dừng vòng lặp khi tìm thấy user
        }
      }
    }
    return response.code == 200 || response.code == 201;
  }


}