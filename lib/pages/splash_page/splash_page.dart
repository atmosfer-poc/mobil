import 'package:atmosfer/core/custom_animations.dart';
import 'package:atmosfer/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _splashEvents().then(
          (value) {
            if (value != null) {
              Get.offAll(
                value,
              );
            }
          },
        );
      },
    );
    super.initState();
  }

  Future<Widget?> _splashEvents() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    return const LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: SizedBox(
            height: 150,
            width: 150,
            child: CustomAnimations.turkcellLoading,
          ),
        ),
      ),
    );
  }
}
