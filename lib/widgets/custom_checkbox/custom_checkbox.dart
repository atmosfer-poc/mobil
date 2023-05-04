import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final double size;
  final Color activeColor;
  final Color inactiveColor;
  final Function(bool)? onChanged;
  final Color? fillColor;
  final Widget? checkItem;
  final double? radius;
  final double? borderSize;
  final bool? value;
  final EdgeInsetsGeometry insetPadding;
  const CustomCheckbox({
    Key? key,
    this.size = 20,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.onChanged,
    this.fillColor,
    this.checkItem = const Icon(
      CupertinoIcons.check_mark,
      color: Colors.black,
      size: 14,
    ),
    this.radius,
    this.borderSize,
    this.value,
    this.insetPadding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _checked = false;

  @override
  void initState() {
    if (widget.value != null) _checked = widget.value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _checked = !(widget.value ?? _checked);
          },
        );
        if (widget.onChanged != null) widget.onChanged!.call(_checked);
      },
      child: AnimatedContainer(
        height: widget.size,
        width: widget.size,
        padding: widget.insetPadding,
        decoration: BoxDecoration(
          color: (widget.value ?? _checked) ? widget.fillColor : null,
          border: Border.all(
            color: (widget.value ?? _checked) ? widget.activeColor : widget.inactiveColor,
            width: widget.borderSize ?? 1,
          ),
          borderRadius: BorderRadius.circular(
            widget.radius ?? 4,
          ),
        ),
        duration: const Duration(
          milliseconds: 175,
        ),
        child: (widget.value ?? _checked) ? widget.checkItem : null,
      ),
    );
  }
}
