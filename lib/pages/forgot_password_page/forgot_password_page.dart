import 'package:atmosfer/pages/login_page/login_page_controller.dart';
import 'package:atmosfer/widgets/custom_button/custom_button.dart';
import 'package:atmosfer/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:atmosfer/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  void dispose() {
    Get.delete<LoginPageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LoginPageController());
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
    return Column(
      children: [
        const Header(
          header: "Şifremi Unuttum",
          backHeader: true,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CustomTextFormField(
                    label: "Mail Adresiniz",
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
                  child: CustomButton(
                    text: "Devam Et",
                    onPressed: (startLoading, stopLoading) async {
                      startLoading();
                      await Future.delayed(
                        const Duration(
                          seconds: 1,
                        ),
                      );
                      stopLoading();
                    },
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
