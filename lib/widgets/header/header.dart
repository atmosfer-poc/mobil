import 'package:atmosfer/core/custom_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final String header;
  final bool backHeader;
  const Header({
    super.key,
    required this.header,
    this.backHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 75,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (Navigator.of(context).canPop() && backHeader)
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    CupertinoIcons.chevron_back,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              else
                const Image(
                  width: 40,
                  height: 40,
                  image: CustomImages.logo,
                  color: Colors.white,
                ),
              Expanded(
                child: Text(
                  header,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
              ),
              if (Navigator.of(context).canPop() && backHeader)
                const Image(
                  width: 40,
                  height: 40,
                  image: CustomImages.logo,
                  color: Colors.white,
                )
              else
                const SizedBox(
                  width: 40,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
