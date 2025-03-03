import 'package:flutter/widgets.dart';

class CustomScrollController extends ScrollController {
  VoidCallback? _endOfListListener;
  double _offset = 0.0;

  void endOfListNotifier(
    VoidCallback listener, {
    double offset = 0.0,
  }) {
    _endOfListListener = listener;
    _offset = _offset;

    super.addListener(_endOfListNotifierCheck);
  }

  void removeEndOfListNotifier(VoidCallback listener) {
    _endOfListListener = null;
    _offset = 0.0;

    super.removeListener(_endOfListNotifierCheck);
  }

  void _endOfListNotifierCheck() {
    if (super.position.pixels >= super.position.maxScrollExtent - _offset) {
      _endOfListListener?.call();
    }
  }
}
