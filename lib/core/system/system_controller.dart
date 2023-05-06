import 'package:atmosfer/models/login_response_model.dart';
import 'package:get/get.dart';

class SystemController extends GetxController {
  LoginResponseModel? loginResponseModel;

  void login(LoginResponseModel? loginResponseModel) {
    this.loginResponseModel = loginResponseModel;
    update();
  }
}
