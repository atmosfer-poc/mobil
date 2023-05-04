import 'package:atmosfer/core/atmosfer_navigator.dart';
import 'package:atmosfer/widgets/header/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({
    super.key,
  });

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
        Header(
          header: "Turkcell Başvuru",
          backHeader: true,
          customBackFunction: () {
            AtmosferNavigator.popUntil(
              "/home",
            );
          },
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  CupertinoIcons.check_mark,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Başvurunuz Alınmıştır",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
