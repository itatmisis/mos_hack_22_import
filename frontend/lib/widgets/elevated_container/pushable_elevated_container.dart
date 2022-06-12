import 'package:flutter/material.dart';
import 'elevated_container.dart';
export 'decorations.dart';

class PushableElevatedContainer extends StatefulWidget {
  PushableElevatedContainerDecoration pushableElevatedContainerDecoration = PushableElevatedContainerDecoration();
  final Widget? child;
  final double? width, height;
  final void Function()? onTap;

  late EdgeInsets? padding;
  late BorderRadius borderRadius;

  PushableElevatedContainer({Key? key, PushableElevatedContainerDecoration? decoration, this.child, this.width, this.height, this.onTap}) :
        super(key: key) {
    if (decoration != null) {
      pushableElevatedContainerDecoration = decoration;
    }

    switch (pushableElevatedContainerDecoration.beautifulPadding) {
      case BeautuifulPadding.all:
        padding = EdgeInsets.all(pushableElevatedContainerDecoration.borderRadius);
        break;
      case BeautuifulPadding.horizontal:
        padding = EdgeInsets.symmetric(horizontal: pushableElevatedContainerDecoration.borderRadius);
        break;
      case BeautuifulPadding.vertical:
        padding = EdgeInsets.symmetric(vertical: pushableElevatedContainerDecoration.borderRadius);
        break;
      case BeautuifulPadding.none:
        padding = EdgeInsets.zero;
        break;
    }

    borderRadius = BorderRadius.all(Radius.circular(pushableElevatedContainerDecoration.borderRadius));
  }

  @override
  State<PushableElevatedContainer> createState() => _PushableElevatedContainerState();
}

class _PushableElevatedContainerState extends State<PushableElevatedContainer> {
  bool isTouched = false;

  void onTapDown(TapDownDetails tapDownDetails) {
    setState(() => isTouched = true);
  }

  void onTapUp(TapUpDetails tapDownDetails) {
    setState(() => isTouched = false);

    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      child: AnimatedPhysicalModel(
        duration: widget.pushableElevatedContainerDecoration.duration,
        elevation: isTouched? widget.pushableElevatedContainerDecoration.touchedElevation : widget.pushableElevatedContainerDecoration.elevation,
        color: widget.pushableElevatedContainerDecoration.backgroundColor,
        borderRadius: widget.borderRadius,
        shadowColor: widget.pushableElevatedContainerDecoration.shadowColor,
        curve: widget.pushableElevatedContainerDecoration.animationCurve,
        shape: BoxShape.rectangle,
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: widget.pushableElevatedContainerDecoration.backgroundColor,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}