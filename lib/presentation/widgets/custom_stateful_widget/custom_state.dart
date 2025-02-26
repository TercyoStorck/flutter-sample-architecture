import 'package:flutter/widgets.dart';
import 'package:flutter_sample_architecture/application/controller/contracts/disposable_controller.dart';
import 'package:depin/depin.dart';

abstract class CustomState<T extends StatefulWidget, C extends DisposableController> extends State<T> {
  @protected
  final controller = Inject.instance<C>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
