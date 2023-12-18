import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silktech_users/config/themes/colors.dart';
import 'package:silktech_users/config/themes/styles.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.focusNode,
    this.fillColor,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.keyboardType,
    this.style,
    this.readOnly = false,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.onSubmitted,
    this.inputFormatters,
  });

  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label?.isNotEmpty == true)
          Text(
            label!,
            style: AppStyles.footnoteBold.copyWith(
              color: AppColors.darkGray,
            ),
          ),
        if (label?.isNotEmpty == true) const SizedBox(height: 4),
        TextField(
          onSubmitted: onSubmitted,
          autofocus: autofocus,
          focusNode: focusNode,
          controller: controller,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            hintText: hintText ?? '',
            hintStyle: AppStyles.body.copyWith(color: AppColors.gray),
            filled: true,
            fillColor: fillColor ?? AppColors.superLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppStyles.btnRadius,
                ),
              ),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
          style: style ??
              AppStyles.subhead.copyWith(
                color: AppColors.black,
              ),
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
