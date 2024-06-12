import 'package:flutter/material.dart';

import '../core/constance/color_constance.dart';

class AppStyle {
  static TextStyle appBarTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 11.5,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle bottomSheetTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle appbarTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ColorConstant.primaryColor,
    fontFamily: 'roboto',
  );

  static TextStyle bottomSheetTextStyleW400 = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle bottomNavBarTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle drawerItemListTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle toolTipTextStyle = const TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle vehicleListItemTextStyle = TextStyle(
    color: ColorConstant.fromHex("#717171"),
    fontSize: 14,
    fontFamily: AppFonts.roboto,
    textBaseline: TextBaseline.alphabetic,
    fontWeight: FontWeight.w400,
  );

  static TextStyle vehicleListItemButtonTextStyle = TextStyle(
    color: ColorConstant.black.withOpacity(0.9),
    fontSize: 17.5,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w700,
  );

  static TextStyle vehicleListItemSpeedTextStyle = TextStyle(
    color: ColorConstant.fromHex('#717171'),
    fontSize: 21,
    fontFamily: AppFonts.digitalNumbers,
    fontWeight: FontWeight.w400,
  );

  static TextStyle vehicleListItemSpeedTextStyleArial = TextStyle(
    color: ColorConstant.fromHex('#717171'),
    fontSize: 17,
    fontFamily: AppFonts.arial,
    fontWeight: FontWeight.w400,
  );

  static TextStyle dashboardNormalTextStyle = TextStyle(
    color: ColorConstant.black,
    fontSize: 16,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w500,
  );

  static TextStyle dashboardBoldRedTextStyle = TextStyle(
    color: ColorConstant.red,
    fontSize: 16,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w700,
  );

  static TextStyle dashboardBoldTextStyle = TextStyle(
    color: ColorConstant.black,
    fontSize: 16,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
  );

  static TextStyle dashboardTitleBoldTextStyle = TextStyle(
    color: ColorConstant.black,
    fontSize: 16.5,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
  );

  static TextStyle dashboardTitleBoldGreyTextStyle = TextStyle(
    color: ColorConstant.fromHex("#9D9D9D"),
    fontSize: 16.5,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
  );

  static TextStyle dashboardGreyTextStyle = TextStyle(
    color: ColorConstant.fromHex("#A3A3A3"),
    fontSize: 16.5,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w400,
  );

  static TextStyle dashboardBlackBigTextStyle = TextStyle(
    color: ColorConstant.black,
    fontSize: 20,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w700,
  );

  static TextStyle dialogTextStyle = TextStyle(
    color: ColorConstant.black,
    fontSize: 18,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w500,
  );

  static TextStyle geofenceTitleTextStyle = TextStyle(
    color: ColorConstant.black,
    fontSize: 17,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w400,
  );

  static TextStyle geofenceTypeTextStyle = TextStyle(
    color: ColorConstant.fromHex('#717171'),
    fontSize: 17,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w400,
  );

  static TextStyle geofenceBodyTextStyle = TextStyle(
    color: ColorConstant.black,
    fontSize: 14,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w400,
  );

  static const font12Weight400Black = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'roboto',
  );
  static const font12Weight500BlueText = TextStyle(
    color: Colors.blue,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const font12Weight500BlueUnderline = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.blue,
      fontFamily: 'roboto',
      decoration: TextDecoration.underline);

  static const font12Weight500Black = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: 'roboto',
  );
  static const font12Weight500RedUnderline = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.red,
      fontFamily: 'roboto',
      decoration: TextDecoration.underline);

  // Font Size 12, Red
  static const font12Weight400Red = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFFD50000),
    fontFamily: 'roboto',
  );
  static const font12Weight600Red = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.red,
    fontFamily: 'roboto',
  );
  static const font14Weight400Black = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff161616),
  );

  static const font14Weight500Black = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xff161616),
  );

  static const font14Weight700Black = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Color(0xff161616));

  static const font16Weight400Black = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'Roboto');

  // static const font14Weight400 = TextStyle(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.black,
  //     fontFamily: 'Roboto');

  static const font16Weight400Blue = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.blue,
      fontFamily: 'Roboto');
  static const font16Weight500Black =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);
  static const font16Weight500Blue = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.blue);

  static const font16Weight500BlackBold = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Roboto');

  static const font14Weight700GreyText = TextStyle(
      color: Colors.black,
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w700);

  static const font16Weight500Grey =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey);
  static const font16Weight600Black = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  static TextStyle font16Weight600Blue = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ColorConstant.primaryColor);

  static const font16Weight700Black = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'Roboto',
  );

  static TextStyle font16Weight700Blue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorConstant.primaryColor,
    fontFamily: 'Roboto',
  );

  static TextStyle font20Weight500Text = const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black);

  static const font18Weight700Black = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'roboto',
  );
  static const font18Weight700Blue = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Color(0xff1886EF),
    fontFamily: 'roboto',
  );

  static const font12Weight500White = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const font16Weight600White = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const font16Weight400ReportTextColour = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xffA3A3A3),
  );

  static const font12Weight400Gray = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xff666666),
    fontFamily: 'roboto',
  );

  static const font26Weight700BlackTextColour = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const font12Weight500Blue = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
    fontFamily: 'roboto',
  );

  static TextStyle font16Weight400GreyText = TextStyle(
      color: ColorConstant.grey,
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static TextStyle font16Weight500GreyText = TextStyle(
      color: ColorConstant.grey,
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static const font16Weight600WhiteUnderline = TextStyle(
      color: Colors.white,
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white);

  static const font20Weight500Black = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle errorTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  //login
  //Border Style
  // static OutlineInputBorder textFieldInputBorder = OutlineInputBorder(
  // borderSide: BorderSide(color: ColorConstant.primaryColor, width: 1.5),
  // borderRadius: BorderRadius.circular(10)
  // );

  static OutlineInputBorder editTextFieldInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.primaryColor, width: 1.5),
      borderRadius: BorderRadius.circular(10));

  static UnderlineInputBorder textFieldInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: ColorConstant.primaryColor, width: 1.5),
  );

  static OutlineInputBorder textFieldInputBorderForDistrictDropDown =
      OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.red, width: 2),
          borderRadius: BorderRadius.circular(10));

  static const font26Weight700WhiteTextColour = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const font12Weight400HintText = TextStyle(
    color: Color(0xff8A8A8A),
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const font12Weight400HintTextGrey = TextStyle(
    color: Colors.grey,
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xff5193BB),
        width: 2,
      ));

  static OutlineInputBorder outlineInputRedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ));

  //Forget Password

  static const font14Weight400GreyText = TextStyle(
      color: Colors.grey,
      fontFamily: 'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w400);

  static const font16Weight400BlackText = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto');

  //driver profile

  static const font12Weight500RedText = TextStyle(
    color: Colors.red,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  //engine bock pin
  static const font12Weight400BlackText = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      decoration: TextDecoration.underline);

  //engine block
  static const font16Weight600BlackText = TextStyle(
      color: Colors.black,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      decoration: TextDecoration.underline);

  // static const font16Weight500Blue = TextStyle(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w500,
  //   color: Colors.blue,
  //   fontFamily: 'Roboto',
  // );

  static const font16Weight500ReportTextColour = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xffA3A3A3),
  );

  //Terms & Condition

  static TextStyle font22Weight700PrimaryColorText = TextStyle(
    color: ColorConstant.primaryColor,
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font24Weight500Black = const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle font11Weight400Text = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font15Weight400Text = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Color(0xFF717171),
  );

  static TextStyle font25Weight700Text = const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: Colors.black);
}

class AppFonts {
  static const roboto = 'Roboto';
  static const digitalNumbers = 'Digital Numbers';
  static const arial = 'Arial';
}
