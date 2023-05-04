import 'package:atmosfer/models/city.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class JobApplyPageController extends GetxController {
  TextEditingController identityController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  City? selectedCity;
  PlatformFile? selectedFile;
  String? workingStyle;
  bool approved = false;

  bool get canApply {
    bool identity = identityController.text.isNotEmpty;
    bool name = nameController.text.isNotEmpty;
    bool surname = surnameController.text.isNotEmpty;
    bool phone = phoneNumberController.text.isNotEmpty;

    bool result = identity && name && surname && phone && selectedCity != null && selectedFile != null && approved;
    return result;
  }

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
    );

    if (result != null) {
      selectedFile = result.files.single;
    }
    update();
  }

  void updateTextStatus() {
    update();
  }
}
