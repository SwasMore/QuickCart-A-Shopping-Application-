// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';

class Baadge extends StatefulWidget {
  const Baadge({
    required Key key,
    required this.child,
    required this.value,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  State<Baadge> createState() => _BadgeState();
}

class _BadgeState extends State<Baadge> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // ignore: unnecessary_null_comparison
              color: widget.color != null
                  ? widget.color
                  : Color.fromARGB(31, 38, 171, 47),
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              widget.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
