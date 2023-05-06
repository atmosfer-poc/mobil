import 'package:atmosfer/core/api/api_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContractPageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  bool isFirstScrollDown = false;
  String? contract;
  bool loading = false;

  @override
  void onInit() {
    loadContract();
    super.onInit();
  }

  void scrollDownChange() {
    isFirstScrollDown = true;
    update();
  }

  Future<void> loadContract() async {
    loading = true;
    update();
    var response = await APIConstants.sendGet(
      APIConstants.getContractUrl,
    );
    loading = false;
    update();

    if (response.statusCode != 200) return;

    Map? content = response.data;
    if (content != null && content.containsKey("content")) {
      contract = content["content"];
      update();
    }

    if (scrollController.hasClients && scrollController.position.maxScrollExtent <= 10) {
      scrollDownChange();
    }
  }
}
