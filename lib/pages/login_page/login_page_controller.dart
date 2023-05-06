import 'package:atmosfer/core/api/api_constants.dart';
import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/core/system/system_controller.dart';
import 'package:atmosfer/models/login_register_request_model.dart';
import 'package:atmosfer/models/login_response_model.dart';
import 'package:atmosfer/widgets/custom_toast/custom_toast.dart';
import 'package:atmosfer/widgets/otp_modal/otp_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final SystemController systemController = Get.find<SystemController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login({String? otp}) async {
    String username = usernameController.text;
    String password = passwordController.text;
    if (username.isEmpty) {
      CustomToast(
        text: "Kullanıcı adınızı doldurmadan giriş yapamazsınız.",
        toastType: CustomToastType.warning,
      ).showToast();
      return;
    }
    if (password.isEmpty) {
      CustomToast(
        text: "Şifrenizi doldurmadan giriş yapamazsınız.",
        toastType: CustomToastType.warning,
      ).showToast();
      return;
    }

    LoginRegisterRequestModel loginRegisterRequestModel = LoginRegisterRequestModel(
      username: username,
      password: password,
    );

    if (otp != null) {
      loginRegisterRequestModel.otp = otp;
    }

    var response = await APIConstants.sendPost(
      APIConstants.getLoginUrl,
      data: loginRegisterRequestModel.toMap(),
    );

    var data = response.data;

    if (data is! Map) {
      CustomToast(
        text: "Servis kaynaklı bir hata oluştu, lütfen tekrar deneyiniz.",
        toastType: CustomToastType.error,
      ).showToast();
      return;
    }

    String? error = data["error"];
    int? status = int.tryParse(data["status"].toString());
    if (error != null && status != null && status != 200) {
      CustomToast(
        text: error,
        toastType: CustomToastType.error,
      ).showToast();
      return;
    }

    LoginResponseModel loginResponseModel = LoginResponseModel.fromMap(
      Map<String, dynamic>.from(
        data,
      ),
    );
    if (loginResponseModel.requireOtp) {
      String? otp = await AtmosferNavigator.push(
        OTPModal(),
      );
      if (otp == null) {
        CustomToast(
          text: "Giriş başarısız, doğrulama kodunu girdiğinizden emin olunuz.",
          toastType: CustomToastType.warning,
        ).showToast();
        return;
      }
      await login(
        otp: otp,
      );
    } else {
      systemController.login(loginResponseModel);
      AtmosferNavigator.pushAndRemoveUntil(
        "/home",
      );
    }
  }
}
