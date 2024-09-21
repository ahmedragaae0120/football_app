import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSnackBar {
  static void showOverlaySnackBar(
      {required BuildContext context,
      required String message,
      required bool positive}) {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: double.minPositive,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.minPositive,
            decoration: BoxDecoration(
              color: positive
                  ? Colors.green.withOpacity(0.50)
                  : Theme.of(context).colorScheme.secondary.withOpacity(0.50),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    // عرض الـ OverlayEntry
    overlayState.insert(overlayEntry);

    // إزالة الـ OverlayEntry بعد 3 ثوانٍ
    Future.delayed(Duration(seconds: positive ? 2 : 3), () {
      overlayEntry.remove();
    });
  }
}
