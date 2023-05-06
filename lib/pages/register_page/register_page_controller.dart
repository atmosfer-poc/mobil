import 'package:atmosfer/core/api/api_constants.dart';
import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/models/login_register_request_model.dart';
import 'package:atmosfer/widgets/custom_toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    if (username.isEmpty) {
      CustomToast(
        text: "Kullanıcı adınızı doldurmadan kayıt olamazsınız.",
        toastType: CustomToastType.warning,
      ).showToast();
      return;
    }
    if (password.isEmpty) {
      CustomToast(
        text: "Şifrenizi doldurmadan kayıt olamazsınız.",
        toastType: CustomToastType.warning,
      ).showToast();
      return;
    }

    LoginRegisterRequestModel loginRegisterRequestModel = LoginRegisterRequestModel(
      username: username,
      password: password,
    );

    var response = await APIConstants.sendPost(
      APIConstants.getRegisterUrl,
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

    String? email = data["email"];
    String? role = data["role"];
    if (email != null && role != null) {
      CustomToast(
        text: "Kayıt işleminiz başarılı bir şekilde gerçekleştirildi. Mail adresinize gelen doğrulama linki ile hesabınızı doğruladıktan sonra giriş yapabilirsiniz.",
        toastType: CustomToastType.success,
        duration: const Duration(
          seconds: 6,
        ),
      ).showToast();
      AtmosferNavigator.popUntil(
        "/login",
      );
    } else {
      CustomToast(
        text: "Servis kaynaklı bir hata oluştu, lütfen tekrar deneyiniz.",
        toastType: CustomToastType.error,
      ).showToast();
    }
  }
}
