import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constance/color_constance.dart';
import '../../theme/app_style.dart';

class CustomTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? color;
  final bool readOnly;
  final int? maxLine;
  final bool isObSecureText;
  final String? hintText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final Function(String)? onChangeCallback;
  final String? Function(String? value)? validator;
  final VoidCallback onTapCallback;

  const CustomTextField({
    super.key,
    this.height,
    this.width,
    this.suffixIcon,
    this.prefixIcon,
    this.color,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.maxLine,
    this.hintText,
    this.validator,
    this.onChangeCallback,
    this.isObSecureText = false,
    this.controller,
    required this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 1.5, color: color ?? const Color(0xFFD50000)),
      ),
      child: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return TextFormField(
              controller: controller,
              maxLines: maxLine ?? 1,
              readOnly: readOnly,
              keyboardType: textInputType,
              validator: validator,
              autovalidateMode: AutovalidateMode.disabled,
              obscureText: isObSecureText,
              onChanged: onChangeCallback,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                contentPadding: EdgeInsets.only(top: 15, left: 14),
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9D9D9D),
                  fontWeight: FontWeight.w400,
                ),
                errorBorder: AppStyle.textFieldInputBorder.copyWith(
                    borderSide: BorderSide(
                        color: ColorConstant.primaryColor, width: 2)),
                border: AppStyle.textFieldInputBorder,
                suffixIcon: suffixIcon ?? const SizedBox(),
                enabledBorder: AppStyle.outlineInputBorder,
                focusedBorder: AppStyle.outlineInputBorder,
              ),
              onTap: () {
                onTapCallback.call();
              },
            );
          },
        ),
      ),
    );
  }
}
