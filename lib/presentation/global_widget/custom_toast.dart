import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';

enum ToastType { success, error, info, warning }

class CustomToast {
  static void show({
    required BuildContext buildContext,
    required String title,
    required String description,
    required ToastType type,
    bool displayTitle = true,
    Duration animationDuration = const Duration(milliseconds: 1000),
    bool autoDismiss = true,
    Position toastPosition = Position.top,
  }) {
    // Set color and icon based on the toast type
    switch (type) {
      case ToastType.success:
        CherryToast.success(
          title: Text(title,
              style: const TextStyle(color: Colors.black, fontSize: 16)),
          // displayTitle: displayTitle,
          description: Text(description,
              style: const TextStyle(color: Colors.black, fontSize: 13)),
          toastPosition: toastPosition,
          animationDuration: animationDuration,
          autoDismiss: autoDismiss,
        ).show(buildContext);
        break;
      case ToastType.error:
        CherryToast.error(
          title: Text(title,
              style: const TextStyle(color: Colors.black, fontSize: 16)),
          // displayTitle: displayTitle,
          description: Text(description,
              style: const TextStyle(color: Colors.black, fontSize: 13)),
          toastPosition: toastPosition,
          animationDuration: animationDuration,
          autoDismiss: autoDismiss,
        ).show(buildContext);
        break;
      case ToastType.info:
        CherryToast.info(
          title: Text(title,
              style: const TextStyle(color: Colors.black, fontSize: 16)),
          // displayTitle: displayTitle,
          description: Text(description,
              style: const TextStyle(color: Colors.black, fontSize: 13)),
          toastPosition: toastPosition,
          animationDuration: animationDuration,
          autoDismiss: autoDismiss,
        ).show(buildContext);
        break;
      case ToastType.warning:
        CherryToast.warning(
          title: Text(title,
              style: const TextStyle(color: Colors.black, fontSize: 16)),
          // displayTitle: displayTitle,
          description: Text(description,
              style: const TextStyle(color: Colors.black, fontSize: 13)),
          toastPosition: toastPosition,
          animationDuration: animationDuration,
          autoDismiss: autoDismiss,
        ).show(buildContext);
        break;
    }
  }
}
