import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController? textEditingController;
  final bool required;
  final String? hint;
  final Function()? onComplete;
  final bool password;
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.required,
    this.textEditingController,
    this.onComplete,
    this.hint,
    this.password = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final TextEditingController textEditingController = TextEditingController();
  TextEditingController get getTextEditingController => widget.textEditingController ?? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.label + (widget.required ? " (Zorunlu)" : ""),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 44,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              width: 1,
              color: Colors.black45,
            ),
          ),
          child: TextFormField(
            controller: getTextEditingController,
            onChanged: (value) async {
              String oldValue = value;
              await Future.delayed(
                const Duration(
                  milliseconds: 1000,
                ),
              );
              String newValue = getTextEditingController.text;

              if (oldValue == newValue) {
                widget.onComplete?.call();
              }
            },
            cursorColor: Colors.black,
            obscureText: widget.password,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              hintText: widget.hint,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
