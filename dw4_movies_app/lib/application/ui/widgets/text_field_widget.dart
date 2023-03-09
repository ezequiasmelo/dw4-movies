import 'package:flutter/material.dart';

// import '../../core/theme/app_theme/app_theme_interface.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const TextFieldWidget(
      {Key? key,
      required this.label,
      this.controller,
      this.onChanged,
      this.obscureText = false,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final appTheme = Get.find<AppThemeInterface>();

    final fieldBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(23.0),
        borderSide: BorderSide(
            // color: appTheme.colors.border,
            ));

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        // fillColor: appTheme.colors.background,
        label: Text(
          label,
          // style: appTheme.textStyles.body,
        ),
        border: fieldBorder,
        enabledBorder: fieldBorder,
        focusedBorder: fieldBorder,
      ),
    );
  }
}
