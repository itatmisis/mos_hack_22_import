import 'package:flutter/material.dart';
import 'decorations.dart';
export 'decorations.dart';

class ElevatedContainer extends StatelessWidget {
  ElevatedContainerDecoration elevatedContainerDecoration = ElevatedContainerDecoration();
  final Widget? child;
  final double? width, height;

  late EdgeInsets? padding;
  late BorderRadius borderRadius;

  ElevatedContainer({Key? key, ElevatedContainerDecoration? decoration, this.child, this.width, this.height}) :
        super(key: key) {
    if (decoration != null) {
      this.elevatedContainerDecoration = decoration;
    }

    switch (elevatedContainerDecoration.beautifulPadding) {
      case BeautuifulPadding.all:
        padding = EdgeInsets.all(elevatedContainerDecoration.borderRadius);
        break;
      case BeautuifulPadding.horizontal:
        padding = EdgeInsets.symmetric(horizontal: elevatedContainerDecoration.borderRadius);
        break;
      case BeautuifulPadding.vertical:
        padding = EdgeInsets.symmetric(vertical: elevatedContainerDecoration.borderRadius);
        break;
      case BeautuifulPadding.none:
        padding = EdgeInsets.zero;
        break;
    }

    borderRadius = BorderRadius.all(Radius.circular(this.elevatedContainerDecoration.borderRadius));
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: elevatedContainerDecoration.elevation,
      color: elevatedContainerDecoration.backgroundColor,
      shadowColor: elevatedContainerDecoration.shadowColor,
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: elevatedContainerDecoration.backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: child,
        )
      ),
    );
  }
}