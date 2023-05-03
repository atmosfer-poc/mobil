import 'package:atmosfer/pages/forgot_password_page/forgot_password_page.dart';
import 'package:atmosfer/pages/home_page/home_page.dart';
import 'package:atmosfer/pages/login_page/login_page_controller.dart';
import 'package:atmosfer/pages/register_page/register_page.dart';
import 'package:atmosfer/widgets/custom_button/custom_button.dart';
import 'package:atmosfer/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:atmosfer/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          header: "Giriş Yap",
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
                    label: "Kullanıcı Adı",
                    required: true,
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
                    label: "Şifre",
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
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              const ForgotPasswordPage(),
                            );
                          },
                          child: const Text(
                            "Şifremi Unuttum",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
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
                  child: CustomButton(
                    text: "Giriş Yap",
                    onPressed: (startLoading, stopLoading) async {
                      startLoading();
                      await Future.delayed(
                        const Duration(
                          seconds: 1,
                        ),
                      );
                      stopLoading();
                      Get.offAll(
                        const HomePage(),
                      );
                    },
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text("veya"),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CustomButton(
                    text: "Kayıt Ol",
                    onPressed: (startLoading, stopLoading) async {
                      startLoading();
                      await Future.delayed(
                        const Duration(
                          seconds: 1,
                        ),
                      );
                      stopLoading();
                      Get.to(
                        const RegisterPage(),
                      );
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