import 'package:atmosfer/core/api/api_constants.dart';
import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/models/register_request_model.dart';
import 'package:atmosfer/widgets/custom_toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty) {
      CustomToast(
        text: "E-Mailinizi doldurmadan kayıt olamazsınız.",
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

    RegisterRequestModel registerRequestModel = RegisterRequestModel(
      email: email,
      password: password,
    );

    var response = await APIConstants.sendPost(
      APIConstants.getRegisterUrl,
      data: registerRequestModel.toMap(),
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

    String? returnEmail = data["email"];
    String? role = data["role"];
    if (returnEmail != null && role != null) {
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
