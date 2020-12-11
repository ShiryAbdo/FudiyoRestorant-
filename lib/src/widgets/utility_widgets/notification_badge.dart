import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final Color color;
  final String counter;
  final double size;

  const NotificationBadge({
    @required this.color,
    @required this.counter,
    this.size = 20,
  }) : assert(color != null && counter != null && size != null);

  const NotificationBadge.large({
    @required this.color,
    @required this.counter,
    this.size = 24,
  }) : assert(color != null && counter != null && size != null);

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final fontSize = size - 10;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Text(
          counter,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            height: isRtl ? (fontSize) * 0.1 : (fontSize) * 0.11,
            inherit: isRtl ? false : true,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
