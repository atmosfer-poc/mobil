import 'dart:convert';

import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/pages/job_apply_page/job_apply_page_controller.dart';
import 'package:atmosfer/pages/job_detail_page/job_detail_page_controller.dart';
import 'package:atmosfer/widgets/custom_button/custom_button.dart';
import 'package:atmosfer/widgets/header/header.dart';
import 'package:atmosfer/widgets/loading_widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({
    super.key,
  });

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  void dispose() {
    Get.delete<JobDetailPageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: GetBuilder<JobDetailPageController>(
                          builder: (_) {
                            return Text(
                              _.jobDetailModel?.title ?? "İş Tanımı",
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            );
                          },
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
                    child: RawScrollbar(
                      trackVisibility: true,
                      thickness: 6,
                      thumbColor: Colors.black,
                      radius: const Radius.circular(
                        16,
                      ),
                      padding: EdgeInsets.zero,
                      child: GetBuilder<JobDetailPageController>(
                        builder: (_) {
                          if (_.loading) {
                            return const LoadingWidget(
                              black: true,
                              size: 50,
                            );
                          }

                          if (_.jobDetailModel == null) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 24,
                              ),
                              child: Text(
                                "Sistem hatası yüzünden detay bilgisi yüklenemedi, lütfen daha sonra tekrar deneyiniz.",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }

                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 24,
                              ),
                              child: Column(
                                children: [
                                  Image(
                                    image: Image.memory(
                                      base64Decode(
                                        _.jobDetailModel!.image,
                                      ),
                                    ).image,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Html(
                                    data: _.jobDetailModel!.content,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
                child: CustomButton(
                  text: "Başvur",
                  height: 60,
                  onPressed: (startLoading, stopLoading) {
                    Get.put(
                      JobApplyPageController(),
                    );
                    AtmosferNavigator.push(
                      "/apply",
                    );
                  },
                  maxFontSize: 24,
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
