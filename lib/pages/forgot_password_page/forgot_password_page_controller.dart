import 'package:atmosfer/core/api/api_constants.dart';
import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/models/forgot_password_request_model.dart';
import 'package:atmosfer/widgets/custom_toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPageController extends GetxController {
  final TextEditingController mailController = TextEditingController();

  Future<void> sendMail() async {
    String mail = mailController.text;
    if (mail.isEmpty) {
      CustomToast(
        text: "Mail adresinizi girmeden şifrenizi sıfırlayamazsınız.",
        toastType: CustomToastType.warning,
      ).showToast();
      return;
    }

    ForgotPasswordRequestModel forgotPasswordRequestModel = ForgotPasswordRequestModel(
      email: mail,
    );

    var response = await APIConstants.sendPut(
      APIConstants.getPasswordResetUrl,
      data: forgotPasswordRequestModel.toMap(),
    );

    if (response.statusCode == 200) {
      CustomToast(
        text: "İşlem başarılı, şifrenizi sıfırlamak için mailine gelen link ile ilerleyebilirsiniz.",
        toastType: CustomToastType.success,
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
