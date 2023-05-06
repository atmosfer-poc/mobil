import 'package:atmosfer/pages/contract_page/contract_page_controller.dart';
import 'package:atmosfer/widgets/custom_button/custom_button.dart';
import 'package:atmosfer/widgets/header/header.dart';
import 'package:atmosfer/widgets/loading_widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({
    super.key,
  });

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  @override
  void dispose() {
    Get.delete<ContractPageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(
      ContractPageController(),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ContractPageController>();

    return Column(
      children: [
        const Header(
          header: "Turkcell Başvuru",
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 32,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "Aydınlatma Metni",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey[350] ?? Colors.grey,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(
                            0,
                            0,
                          ),
                          color: Colors.black26,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 7.5,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification) {
                          final metrics = notification.metrics;
                          if (metrics.atEdge) {
                            bool isTop = metrics.pixels == 0;
                            if (!isTop) {
                              controller.scrollDownChange();
                            }
                          }
                        }
                        return false;
                      },
                      child: RawScrollbar(
                        trackVisibility: true,
                        thickness: 6,
                        thumbColor: Colors.black,
                        radius: const Radius.circular(
                          16,
                        ),
                        padding: EdgeInsets.zero,
                        child: SingleChildScrollView(
                          controller: controller.scrollController,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 24,
                            ),
                            child: GetBuilder<ContractPageController>(
                              builder: (_) {
                                if (_.loading) {
                                  return const LoadingWidget(
                                    black: true,
                                    size: 50,
                                  );
                                }

                                if (_.contract == null) {
                                  return const Text(
                                    "Sistemsel bir hatadan dolayı metin yüklenemedi. Lütfen tekrar deneyiniz.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                }

                                return Html(
                                  data: _.contract!,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: GetBuilder<ContractPageController>(
                  builder: (_) {
                    return CustomButton(
                      text: "Onayla",
                      height: 60,
                      enabled: _.isFirstScrollDown,
                      onPressed: (startLoading, stopLoading) {
                        Get.back(
                          result: true,
                        );
                      },
                      maxFontSize: 24,
                      backgroundColor: _.isFirstScrollDown ? Colors.black : Colors.grey,
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
