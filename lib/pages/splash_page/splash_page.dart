import 'dart:convert';

import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/core/core.dart';
import 'package:atmosfer/models/city.dart';
import 'package:atmosfer/widgets/loading_widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              AtmosferNavigator.pushAndRemoveUntil(
                value,
              );
            }
          },
        );
      },
    );
    super.initState();
  }

  Future<String?> _splashEvents() async {
    final key = await rootBundle.loadString('assets/data/cities.json');
    Map<String, String> cityMap = Map<String, String>.from(jsonDecode(key));
    AtmosferCore.cities.clear();
    for (var element in cityMap.keys) {
      var value = cityMap[element]!;
      AtmosferCore.cities.add(
        City(
          id: element,
          name: value,
        ),
      );
    }

    return "/login";
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
        child: const Center(
          child: LoadingWidget(
            size: 75,
            black: true,
          ),
        ),
      ),
    );
  }
}
