import 'dart:io';

import 'package:atmosfer/core/api/api_constants.dart';
import 'package:atmosfer/models/city.dart';
import 'package:atmosfer/pages/job_detail_page/job_detail_page_controller.dart';
import 'package:atmosfer/widgets/custom_toast/custom_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class JobApplyPageController extends GetxController {
  TextEditingController identityController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  City? selectedCity;
  PlatformFile? selectedFile;
  String? workingStyle;
  bool approved = false;

  void changeSelectedCity(City? selectedCity) {
    this.selectedCity = selectedCity;
    update();
  }

  void changeApproved(bool status) {
    approved = status;
    update();
  }

  void changeWorkingStyle(String? workingStyle) {
    this.workingStyle = workingStyle;
    update();
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        "pdf",
        "doc",
        "docx",
      ],
    );

    if (result != null) {
      selectedFile = result.files.single;
    }
    update();
  }

  void updateTextStatus() {
    update();
  }

  Future<bool> applyNewJob() async {
    String identity = identityController.text;
    String name = nameController.text;
    String surname = surnameController.text;
    String phone = phoneNumberController.text;

    if (identity.isEmpty) {
      CustomToast(
        text: "TCKN bilgisinin doldurulması zorunludur",
        toastType: CustomToastType.warning,
      ).showToast();
      return false;
    }
    if (name.isEmpty) {
      CustomToast(
        text: "Ad bilgisinin doldurulması zorunludur",
        toastType: CustomToastType.warning,
      ).showToast();
      return false;
    }
    if (surname.isEmpty) {
      CustomToast(
        text: "Soyad bilgisinin doldurulması zorunludur",
        toastType: CustomToastType.warning,
      ).showToast();
      return false;
    }

    if (selectedFile?.path == null) {
      CustomToast(
        text: "CV bilgisinin doldurulması zorunludur",
        toastType: CustomToastType.warning,
      ).showToast();
      return false;
    }
    if (selectedCity == null) {
      CustomToast(
        text: "Şehir bilgisinin doldurulması zorunludur",
        toastType: CustomToastType.warning,
      ).showToast();
      return false;
    }
    if (phone.isEmpty) {
      CustomToast(
        text: "Telefon bilgisinin doldurulması zorunludur",
        toastType: CustomToastType.warning,
      ).showToast();
      return false;
    }
    if (!approved) {
      CustomToast(
        text: "Aydınlatma Metnini okuyup kabul etmelisiniz",
        toastType: CustomToastType.warning,
      ).showToast();
      return false;
    }

    File file = File(selectedFile!.path!);

    var formData = dio.FormData.fromMap(
      {
        'tckn': identity,
        'name': name,
        'surname': surname,
        'city': selectedCity!.name,
        'phoneNumber': phone,
        'workType': workingStyle,
        'cv': await dio.MultipartFile.fromFile(
          file.path,
          filename: "${name}_$surname.${selectedFile!.name.split(".").last}",
        ),
      },
    );
    final JobDetailPageController jobDetailPageController = Get.find<JobDetailPageController>();
    String path = APIConstants.getJobApplyUrl.replaceAll(
      "<id>",
      jobDetailPageController.job.id.toString(),
    );

    var response = await APIConstants.sendPost(
      path,
      data: formData,
    );

    bool status = response.statusCode == 200;
    if (!status) {
      CustomToast(
        text: "Sistemsel bir hatadan dolayı başvurunuz alınamadı. Lütfen daha sonra tekrar deneyiniz.",
        toastType: CustomToastType.error,
      ).showToast();
    }

    return status;
  }
}
