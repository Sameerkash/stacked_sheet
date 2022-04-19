import 'package:flutter/material.dart';

class StackedSheet extends StatefulWidget {
  final List<StackedChild> children;
  StackedSheet({
    Key? key,
    required this.children,
  })  : assert(children.isNotEmpty),
        super(key: key);

  @override
  State<StackedSheet> createState() => _StackedSheetState();
}

class _StackedSheetState extends State<StackedSheet> {
  int expandedIndex = 0;

  void handleExpanded(int index) {
    setState(() {
      expandedIndex = index;
    });
  }

  Widget handleChild(int index, StackedChild widget) {
    if (expandedIndex == index) {
      return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () => handleExpanded(index),
          child: widget.child,
        ),
      );
    } else if (index == expandedIndex + 1) {
      return Flexible(
        flex: 0,
        child: GestureDetector(
          onTap: () => handleExpanded(index),
          child: widget.button,
        ),
      );
    } else if (index < expandedIndex) {
      return Flexible(
        flex: 0,
        child: GestureDetector(
          onTap: () => handleExpanded(index),
          child: widget.header,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        ...widget.children
            .asMap()
            .entries
            .map((e) => handleChild(e.key, e.value))
            .toList(),
      ],
    );
  }
}

class StackedChild {
  final Widget child;
  final Widget header;
  final Widget button;

  StackedChild({
    required this.child,
    required this.header,
    required this.button,
  });
}
