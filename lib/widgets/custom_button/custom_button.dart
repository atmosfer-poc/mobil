import 'package:atmosfer/widgets/loading_widget/loading_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

enum CustomButtonStates { loading, idle }

class CustomButton extends StatefulWidget {
  final Color? borderColor;
  final Color? overlayColor;
  final Color backgroundColor;
  final Color shadowColor;

  final String? text;
  final int maxLines;
  final Widget? customWidget;
  final TextStyle textStyle;
  final double borderHeight;
  final double borderRadius;
  final double height;
  final double width;
  final double maxFontSize;
  final double elevation;
  final double minFontSize;
  final Function(Function startLoading, Function stopLoading)? onPressed;
  final Widget loadingItem;

  const CustomButton({
    Key? key,
    this.text,
    this.textStyle = const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
    this.borderColor,
    this.overlayColor,
    this.elevation = 0,
    this.borderHeight = 1.5,
    this.borderRadius = 4,
    this.backgroundColor = Colors.transparent,
    this.shadowColor = Colors.transparent,
    this.height = 45,
    this.width = double.infinity,
    this.onPressed,
    this.loadingItem = const LoadingWidget(
      size: 50,
    ),
    this.maxFontSize = 15,
    this.minFontSize = 8,
    this.customWidget,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  CustomButtonStates state = CustomButtonStates.idle;

  Color? get _getBorderColor => widget.borderColor;

  Color? get _getBackgroundColor => widget.backgroundColor;

  Color? get _getOverlayColor => widget.overlayColor;

  Color? get _getShadowColor => widget.shadowColor;

  TextStyle get _getTextStyle => widget.textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          widget.borderRadius,
        ),
      ),
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onPressed != null
            ? () {
                if (widget.onPressed == null) return;
                if (state != CustomButtonStates.idle) return;
                widget.onPressed!(loadButton, idleButton);
              }
            : null,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(_getOverlayColor),
          backgroundColor: MaterialStateProperty.all(_getBackgroundColor),
          elevation: MaterialStateProperty.all(widget.elevation),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              side: _getBorderColor != null
                  ? BorderSide(
                      color: _getBorderColor!,
                      width: widget.borderHeight,
                    )
                  : BorderSide.none,
            ),
          ),
          shadowColor: MaterialStateProperty.all(_getShadowColor),
        ),
        child: widget.customWidget ??
            ((widget.text != null)
                ? state == CustomButtonStates.idle
                    ? AutoSizeText(
                        widget.text!,
                        maxLines: widget.maxLines,
                        maxFontSize: widget.maxFontSize,
                        minFontSize: widget.minFontSize,
                        style: _getTextStyle,
                      )
                    : widget.loadingItem
                : null),
      ),
    );
  }

  void loadButton() {
    setState(() {
      state = CustomButtonStates.loading;
    });
  }

  void idleButton() {
    setState(() {
      state = CustomButtonStates.idle;
    });
  }
}
