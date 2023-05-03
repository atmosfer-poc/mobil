import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController? textEditingController;
  final bool required;
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.required,
    this.textEditingController,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
            controller: widget.textEditingController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
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
