import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constance/color_constance.dart';
import '../../core/constance/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';

class CustomDatePicker extends ConsumerWidget {
  final double? height;
  final double? width;
  final Color? color;
  final bool readOnly;
  final int? maxLine;
  final VoidCallback? buttonCallback;
  final dynamic providerName;
  final String? Function()? validator;

  const CustomDatePicker(
    this.providerName, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.readOnly = false,
    this.maxLine,
    this.buttonCallback,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(providerName).toString();
    final bool isSelected = selectedDate == 'null';

    return Container(
      // height: height ?? 54,
      width: width ?? getDeviceWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        //     border: isCardColor ? null : Border.all(width: 1.5, color: color ?? const Color(0xFFD50000)
        // ),
      ),
      child: Center(
        child: TextFormField(
          maxLines: maxLine ?? 1,
          readOnly: readOnly,
          onTap: () => buttonCallback?.call(),
          validator: (t) => validator?.call(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15, left: 14),
            hintText: isSelected ? "Tap to select date" : selectedDate,
            hintStyle: TextStyle(
              color:
                  !isSelected ? ColorConstant.black : const Color(0xFF9D9D9D),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            errorBorder: AppStyle.textFieldInputBorder.copyWith(
                borderSide:
                    BorderSide(color: ColorConstant.primaryColor, width: 2)),
            border: AppStyle.textFieldInputBorder,
            suffixIcon: Image.asset(
              ImageConstant.date,
              scale: 3.7,
            ),
            enabledBorder: AppStyle.outlineInputBorder,
            focusedBorder: AppStyle.outlineInputBorder,
          ),
        ),
      ),
    );
  }
}
