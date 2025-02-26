import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final int crossAxisCount;
  final List<Widget> children;

  const CustomGridView({
    required this.crossAxisCount,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final rowsAmount = this.children.length / this.crossAxisCount;

    List<Row> rows = [];

    for (var i = 0; i < rowsAmount; i++) {
      final rowChildren = <Widget>[];

      for (var j = 0; j < crossAxisCount; j++) {
        final index = crossAxisCount * i + j;

        if (children.length <= index) {
          rowChildren.add(
            Expanded(
              child: Container(),
            ),
          );
          continue;
        }

        final child = children[index];
        rowChildren.add(
          Expanded(
            child: child,
          ),
        );
      }
      rows.add(
        Row(
          children: rowChildren,
        ),
      );
    }

    return Column(
      children: rows,
    );
  }
}
