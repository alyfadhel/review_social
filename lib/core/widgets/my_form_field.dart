import 'package:flutter/material.dart';
import 'package:social_app/core/resources/values_manager.dart';

import '../resources/color_manager.dart';


class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final  FormFieldValidator<String>? validator;
  final double radius;
  final String label;
  final bool isUpperCase;
  final IconData prefix;
  final Function()? onPressed;
  final IconData? suffix;
  final ValueChanged<String>? onChanged;
  final bool isPassword;

  const MyFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.radius = AppSize.s20,
    required this.label,
    this.isUpperCase = true,
    required this.prefix,
    this.suffix,
    required this.validator,
    this.onPressed,
    this.isPassword = false,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: ColorManager.grey.withOpacity(.4),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
                color: ColorManager.grey.withOpacity(.4), width: 3.0)),
        label: Text(isUpperCase ? label.toUpperCase() : label),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: onPressed, icon: Icon(suffix))
            : null,
      ),
    );
  }
}
