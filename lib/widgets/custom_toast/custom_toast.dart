import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum CustomToastType {
  info(
    Colors.blue,
    CupertinoIcons.italic,
  ),
  success(
    Colors.green,
    CupertinoIcons.checkmark,
  ),
  warning(
    Colors.orange,
    CupertinoIcons.exclamationmark,
  ),
  error(
    Colors.red,
    CupertinoIcons.xmark,
  );

  final Color color;
  final IconData icon;
  const CustomToastType(
    this.color,
    this.icon,
  );
}

class CustomToast {
  final BuildContext? context;
  late FToast fToast;
  final String text;
  final TextStyle textStyle;
  final TextAlign? textAlign;
  final Duration duration;
  final CustomToastType toastType;
  CustomToast({
    required this.text,
    this.toastType = CustomToastType.info,
    this.context,
    this.duration = const Duration(
      seconds: 5,
    ),
    this.textStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.textAlign,
  }) : fToast = FToast();

  Future<void> showToast() async {
    BuildContext? realContext = context ?? Get.context;
    if (realContext == null) return;
    await Fluttertoast.cancel();
    if (realContext.mounted) {
      fToast.init(realContext);
    }
    Widget toast = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                .5,
              ),
              offset: const Offset(
                0,
                0,
              ),
              spreadRadius: 0,
              blurRadius: .5,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: toastType.color,
              ),
              child: Icon(
                toastType.icon,
                size: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                text,
                textAlign: textAlign,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
    if (realContext.mounted) {
      var size = MediaQuery.of(realContext).size;
      fToast.showToast(
        child: toast,
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 100,
            width: size.width,
            child: child,
          );
        },
        toastDuration: duration,
      );
    }
  }
}
