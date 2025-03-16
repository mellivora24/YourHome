import 'package:easy_localization/easy_localization.dart';
import 'package:yourhome_web/screen/login/model/user_model.dart';
import 'package:yourhome_web/screen/login/services/login_service.dart';
import 'package:yourhome_web/utils/core/base/base_notifier.dart';
import 'package:yourhome_web/utils/core/common/toast.dart';

class LoginNotifier extends BaseNotifier{

  UserModel userModel = UserModel(); // khai báo model
  UserModel get model => userModel; // getter
  LoginService loginService = LoginService();

  get emailController => null; // khai báo service


  Future<bool> login({required String username, required String password, }) async {
    return await execute(() async{
      bool isLogin = await loginService.login(username: username, password: password);
      notifyListeners(); // thông báo cho các widget khác biết rằng đã có sự thay đổi

      if (isLogin == 200 || isLogin == 201) {
        showToastTop(message: "account_login.login_success".tr());
        return true;
      } else {
        showToastTop(message: "account_login.login_fail".tr());
        return false;
      }
    });
  }

}