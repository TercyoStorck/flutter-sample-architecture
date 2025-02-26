import 'package:flutter/material.dart';

export 'package:flutter/material.dart';
export 'package:internationalization/internationalization.dart';

abstract class CustomStatefulWidget extends StatefulWidget {
  const CustomStatefulWidget({super.key});

  Future<T?> showAlert<T>(
    BuildContext context,
    String title,
    String content,
    List<TextButton> actions,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          title,
        ),
        content: Text(
          content,
          textAlign: TextAlign.justify,
        ),
        actions: actions,
      ),
    );
  }

  Future<T?> showCustomAlert<T>(
    BuildContext context,
    String title,
    Widget widget, {
    List<TextButton>? actions,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          title,
        ),
        content: widget,
        actions: actions,
      ),
    );
  }
}
