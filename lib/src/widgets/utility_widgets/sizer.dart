import 'package:flutter/material.dart';

class Sizer extends StatelessWidget {
  final double multiplier;
  final bool isVertical;

  const Sizer({this.multiplier = 1, this.isVertical = true})
      : assert(multiplier != null && isVertical != null);

  // Not really needed but for the sake of consistency
  const Sizer.zero({this.multiplier = 0, this.isVertical = true})
      : assert(multiplier != null && isVertical != null);

  const Sizer.qtr({this.multiplier = 0.25, this.isVertical = true})
      : assert(multiplier != null && isVertical != null);

  const Sizer.half({this.multiplier = 0.5, this.isVertical = true})
      : assert(multiplier != null && isVertical != null);

  const Sizer.vertical32({this.multiplier = 2, this.isVertical = true})
      : assert(multiplier != null && isVertical != null);

  const Sizer.vertical48({this.multiplier = 3, this.isVertical = true})
      : assert(multiplier != null && isVertical != null);

  const Sizer.vertical64({this.multiplier = 4, this.isVertical = true})
      : assert(multiplier != null && isVertical != null);

  const Sizer.vertical80({this.multiplier = 5, this.isVertical = true})
      : assert(multiplier != null && isVertical != null);

  const Sizer.qtrHor({this.multiplier = 0.25, this.isVertical = false})
      : assert(multiplier != null && isVertical != null);

  const Sizer.halfHorizontal({this.multiplier = 0.5, this.isVertical = false})
      : assert(multiplier != null && isVertical != null);

  const Sizer.horizontal({this.multiplier = 1, this.isVertical = false})
      : assert(multiplier != null && isVertical != null);

  const Sizer.horizontal32({this.multiplier = 2, this.isVertical = false})
      : assert(multiplier != null && isVertical != null);

  const Sizer.horizontal48({this.multiplier = 3, this.isVertical = false})
      : assert(multiplier != null && isVertical != null);

  const Sizer.horizontal64({this.multiplier = 4, this.isVertical = false})
      : assert(multiplier != null && isVertical != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.isVertical ? 16 * this.multiplier : 0,
      width: this.isVertical ? 0 : this.multiplier * 16,
    );
  }
}
