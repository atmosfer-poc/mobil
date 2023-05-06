import 'package:atmosfer/core/custom_animations.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final bool black;
  const LoadingWidget({
    Key? key,
    this.size = 20,
    this.black = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: black ? CustomAnimations.loadingBlack : CustomAnimations.loading,
    );
  }
}
