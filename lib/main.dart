import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/core/system/system_controller.dart';
import 'package:atmosfer/pages/contract_page/contract_page.dart';
import 'package:atmosfer/pages/forgot_password_page/forgot_password_page.dart';
import 'package:atmosfer/pages/home_page/home_page.dart';
import 'package:atmosfer/pages/job_apply_page/job_apply_page.dart';
import 'package:atmosfer/pages/job_detail_page/job_detail_page.dart';
import 'package:atmosfer/pages/login_page/login_page.dart';
import 'package:atmosfer/pages/register_page/register_page.dart';
import 'package:atmosfer/pages/splash_page/splash_page.dart';
import 'package:atmosfer/pages/success_page/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initSystemProps();

  Get.put(
    SystemController(),
  );

  runApp(
    GetMaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashPage(),
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/forgotpw": (context) => const ForgotPasswordPage(),
        "/register": (context) => const RegisterPage(),
        "/contract": (context) => const ContractPage(),
        "/apply": (context) => const JobApplyPage(),
        "/detail": (context) => const JobDetailPage(),
        "/success": (context) => const SuccessPage(),
      },
      navigatorKey: AtmosferNavigator.getNavigationKey,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => child!,
            ),
          ],
        );
      },
    ),
  );
}

Future<void> _initSystemProps() async {
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );
}
