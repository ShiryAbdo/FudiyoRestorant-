import 'package:flutter/material.dart';

class RadialBodyClipper extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final bool clip;

  const RadialBodyClipper({
    Key key,
    @required this.child,
    this.backgroundColor,
    this.clip = true,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: ClipRRect(
        borderRadius: clip
            ? const BorderRadius.vertical(top: Radius.circular(16))
            : BorderRadius.vertical(top: Radius.zero),
        child: Material(
            child: child, color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
