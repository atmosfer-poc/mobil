import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContractPageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  bool isFirstScrollDown = false;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (scrollController.position.maxScrollExtent <= 10) {
          scrollDownChange();
        }
      },
    );
    super.onInit();
  }

  void scrollDownChange() {
    isFirstScrollDown = true;
    update();
  }
}
