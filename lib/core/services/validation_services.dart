import 'package:nb_utils/nb_utils.dart';

abstract class Validators {
  static String? emailValidator(String? email) {
    email = email?.trim();
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern.toString());
    if (email == null || email.isEmpty) {
      return "Email is required";
    } else if (!regExp.hasMatch(email)) {
      return "Invalid Email";
    }
    return null;
  }

  static String? emailOrPhoneValidator(String? emailOrPhone) {
    emailOrPhone = emailOrPhone?.trim();

    bool isEmail(String input) => RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);

    bool isPhone(String input) =>
        RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
            .hasMatch(input);

    if (emailOrPhone!.isEmpty) {
      return "Email/Phone is required";
    }
    if (!isEmail(emailOrPhone) && !isPhone(emailOrPhone)) {
      // toast("Please enter a valid email or phone number", bgColor: KColor.red);
      return 'Please enter a valid email or phone number';
    }
    return null;
  }

  static String? customPhoneNumberValidator(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'Phone numbers are required';
    }

    // Split the input string into individual phone numbers using commas
    final phoneNumbers = value.split(',');

    // Validate each phone number in the list
    for (var phoneNumber in phoneNumbers) {
      // Remove any non-digit characters from the phone number
      final cleanPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

      // Check if the cleaned phone number has 13 digits and starts with "880"
      if (cleanPhoneNumber.length != 13 ||
          !cleanPhoneNumber.startsWith('880')) {
        return 'Please input a valid number with 880';
      }
    }

    // If all phone numbers pass the checks, return null (indicating a valid input)
    return null;
  }

  static String? newPasswordValidator(String? password) {
    password = password?.trim();
    if (password!.isEmpty) return "Password is required";

    if (password.length < 6) {
      // toast("Password should be at least 6 characters long", bgColor: KColor.red);
      return "Password should be at least 6 characters long";
    }
    return null;
  }

  static String? loginPasswordValidator(String? password) {
    if (password!.isEmpty) return "Password is required";
    // if (password.length < 6) {
    //   // toast("Password should be at least 6 characters long", bgColor: KColor.red);
    //   return "Password should be at least 6 characters long";
    // }
    return null;
  }

  static String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    }

    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9\s.]+$');

    if (!alphanumericRegex.hasMatch(value)) {
      return "Please enter only alphanumeric characters";
    }

    return null;
  }

  static String? setSpeedFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    }

    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9\s.]+$');

    if (!alphanumericRegex.hasMatch(value)) {
      return "Please enter only alphanumeric characters";
    }

    // Check if the value is a valid integer
    try {
      int speedValue = int.parse(value);

      // Check if the integer is non-negative and less than or equal to 999
      if (speedValue >= 0 && speedValue <= 999) {
        return null; // Valid speed value
      } else {
        return "Speed must be a non-negative integer less than or equal to 999";
      }
    } catch (e) {
      return "Please enter a valid number for speed";
    }
  }

  static String? usernameValidator(String? value) {
    if (value!.isEmpty) {
      // toast("Field can't be empty", bgColor: KColor.red);
      return "Username is required";
    }

    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Phone number is required';
    } else if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }
    return null;
  }

  static String? dropdownFieldValidator(String? value, String? errorMessage) {
    if (value == null || value.isEmpty)
      return errorMessage ?? "Please select an item first";

    return null;
  }

  static String? pinValidator(String? value) {
    // Define a regular expression to match numeric strings.
    final RegExp numericRegex = RegExp(r'^[0-9]+$');

    if (value!.isEmpty) {
      return "Pin can't be empty";
    } else if (!numericRegex.hasMatch(value)) {
      return "Please enter a valid pin";
    }
    return null;
  }

  static String? datePickerValidator(String? value) {
    if (value.isEmptyOrNull) {
      return "Please select a valid date";
    }
    return null;
  }

  static String? currencyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Amount can't be empty";
    }

    // final numericRegex = RegExp(r'^\d*\.?\d+$'); //Accepts double numbers
    final numericRegex = RegExp(r'^[1-9]\d*$'); //Accepts only integer numbers

    if (!numericRegex.hasMatch(value)) {
      return "Please enter a valid amount";
    }

    // Additional checks for multiple decimal points or leading/trailing dots.
    if (value.contains(".") &&
        (value.indexOf(".") != value.lastIndexOf(".") ||
            value.startsWith(".") ||
            value.endsWith("."))) {
      return "Please enter a valid amount";
    }

    return null;
  }

  /// Unit Validator
  static String? unitPriceValidator(String? value, String type) {
    if (value == null || value.isEmpty) {
      return "$type can't be empty";
    }

    // final numericRegex = RegExp(r'^\d*\.?\d+$'); //Accepts double numbers
    final numericRegex = RegExp(r'^[1-9]\d*$'); //Accepts only integer numbers

    if (!numericRegex.hasMatch(value)) {
      return "Please enter a valid amount";
    }

    // Additional checks for multiple decimal points or leading/trailing dots.
    if (value.contains(".") &&
        (value.indexOf(".") != value.lastIndexOf(".") ||
            value.startsWith(".") ||
            value.endsWith("."))) {
      return "Please enter a valid amount";
    }

    return null;
  }
}
