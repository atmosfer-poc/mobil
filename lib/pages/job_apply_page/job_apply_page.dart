import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/core/core.dart';
import 'package:atmosfer/models/city.dart';
import 'package:atmosfer/pages/job_apply_page/job_apply_page_controller.dart';
import 'package:atmosfer/widgets/custom_button/custom_button.dart';
import 'package:atmosfer/widgets/custom_checkbox/custom_checkbox.dart';
import 'package:atmosfer/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:atmosfer/widgets/header/header.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobApplyPage extends StatefulWidget {
  const JobApplyPage({super.key});

  @override
  State<JobApplyPage> createState() => _JobApplyPageState();
}

class _JobApplyPageState extends State<JobApplyPage> {
  @override
  void dispose() {
    Get.delete<JobApplyPageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<JobApplyPageController>();
    return Column(
      children: [
        const Header(
          header: "Turkcell Başvuru",
          backHeader: true,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "Başvuran Bilgileri",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CustomTextFormField(
                    label: "TC Kimlik Numarası",
                    textEditingController: _.identityController,
                    onComplete: () {
                      _.updateTextStatus();
                    },
                    required: true,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CustomTextFormField(
                    label: "Ad",
                    textEditingController: _.nameController,
                    required: true,
                    onComplete: () {
                      _.updateTextStatus();
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CustomTextFormField(
                    label: "Soyad",
                    required: true,
                    textEditingController: _.surnameController,
                    onComplete: () {
                      _.updateTextStatus();
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: _CustomFilePicker(),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: _CountryDropdown(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CustomTextFormField(
                    label: "Cep Telefonu Numarası",
                    hint: "5xxxxxxxxx",
                    required: true,
                    textEditingController: _.phoneNumberController,
                    onComplete: () {
                      _.updateTextStatus();
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: _WorkingStyleDropdown(),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: _CustomCheckboxArea(),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: GetBuilder<JobApplyPageController>(
                    builder: (_) {
                      return CustomButton(
                        text: "Başvuruyu Tamamla",
                        onPressed: (startLoading, stopLoading) async {
                          final controller = Get.find<JobApplyPageController>();
                          startLoading();
                          bool status = await controller.applyNewJob();
                          stopLoading();
                          if (status) {
                            AtmosferNavigator.push(
                              "/success",
                            );
                          }
                        },
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomCheckboxArea extends StatelessWidget {
  const _CustomCheckboxArea();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobApplyPageController>(
      builder: (_) {
        return GestureDetector(
          onTap: () async {
            var contractPageResult = await AtmosferNavigator.push(
              "/contract",
            );
            if (contractPageResult != null && contractPageResult is bool) {
              _.changeApproved(contractPageResult);
            }
          },
          child: Row(
            children: [
              CustomCheckbox(
                onChanged: (p0) async {
                  var contractPageResult = await AtmosferNavigator.push(
                    "/contract",
                  );
                  if (contractPageResult != null && contractPageResult is bool) {
                    _.changeApproved(contractPageResult);
                  }
                },
                value: _.approved,
              ),
              const SizedBox(
                width: 12,
              ),
              const Expanded(
                child: Text(
                  "Aydınlatma Metni'ni kabul ediyorum.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomFilePicker extends StatelessWidget {
  const _CustomFilePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: Text(
                "CV (Zorunlu)",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            final controller = Get.find<JobApplyPageController>();
            controller.pickFile();
          },
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                width: 1,
                color: Colors.black45,
              ),
            ),
            child: GetBuilder<JobApplyPageController>(
              builder: (_) {
                if (_.selectedFile == null) {
                  return const Center(
                    child: Icon(
                      CupertinoIcons.plus,
                      color: Colors.black,
                    ),
                  );
                }
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        _.selectedFile!.name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _CountryDropdown extends StatelessWidget {
  const _CountryDropdown();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: Text(
                "Şehir (Zorunlu)",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        DropdownButtonHideUnderline(
          child: GetBuilder<JobApplyPageController>(
            builder: (_) {
              return DropdownButton2<City>(
                itemPadding: const EdgeInsets.only(
                  left: 16,
                ),
                dropdownMaxHeight: 200,
                onChanged: (value) {
                  _.changeSelectedCity(value);
                },
                hint: const Text(
                  "Şehir",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                  size: 16,
                ),
                buttonDecoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(
                    width: 1,
                    color: Colors.black45,
                  ),
                ),
                isExpanded: true,
                isDense: true,
                buttonHeight: 44,
                value: _.selectedCity,
                buttonPadding: const EdgeInsets.only(
                  right: 13,
                ),
                items: AtmosferCore.cities.map(
                  (e) {
                    return DropdownMenuItem<City>(
                      value: e,
                      child: Text(
                        e.name,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _WorkingStyleDropdown extends StatelessWidget {
  const _WorkingStyleDropdown();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: Text(
                "Çalışma Şekli",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        DropdownButtonHideUnderline(
          child: GetBuilder<JobApplyPageController>(
            builder: (_) {
              return DropdownButton2<String>(
                itemPadding: const EdgeInsets.only(
                  left: 16,
                ),
                dropdownMaxHeight: 200,
                onChanged: (value) {
                  _.changeWorkingStyle(value);
                },
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                  size: 16,
                ),
                buttonDecoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(
                    width: 1,
                    color: Colors.black45,
                  ),
                ),
                isExpanded: true,
                isDense: true,
                buttonHeight: 44,
                value: _.workingStyle,
                buttonPadding: const EdgeInsets.only(
                  right: 13,
                ),
                items: AtmosferCore.workingStyles.map(
                  (e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
