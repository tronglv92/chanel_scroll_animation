import "package:flutter/widgets.dart";
import "dart:math";



class SnappingListScrollPhysics extends ScrollPhysics {
  final double mainAxisStartPadding;
  final double itemExtent;
  final double snapInterval;

  const SnappingListScrollPhysics(
      {ScrollPhysics parent,
        this.mainAxisStartPadding = 0.0,
        @required this.itemExtent,
      @required this.snapInterval})
      : super(parent: parent);

  @override
  SnappingListScrollPhysics applyTo(ScrollPhysics ancestor) {
    return SnappingListScrollPhysics(
        parent: buildParent(ancestor),
        mainAxisStartPadding: mainAxisStartPadding,
        snapInterval: snapInterval,
        itemExtent: itemExtent);
  }

  double _getItem(ScrollPosition position) {
    return (position.pixels - mainAxisStartPadding) / itemExtent;
  }

  double _getPixels(ScrollPosition position, double item) {
    return min(item * snapInterval, position.maxScrollExtent);
  }

  double _getTargetPixels(
      ScrollPosition position, Tolerance tolerance, double velocity) {
    double item = _getItem(position);

    if (velocity < -tolerance.velocity)
      item -= 0.5;
    else if (velocity > tolerance.velocity) item += 0.5;
   
    return _getPixels(position, item.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}