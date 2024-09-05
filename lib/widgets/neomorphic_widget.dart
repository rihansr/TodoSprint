import 'package:flutter/material.dart';

class Neomorphic extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double? borderRadius;
  final BoxShape? boxShape;
  final Color? bottomRightShadowColor;
  final Color? topLeftShadowColor;
  final double? bottomRightShadowBlurRadius;
  final double? bottomRightShadowSpreadRadius;
  final double? topLeftShadowBlurRadius;
  final double? topLeftShadowSpreadRadius;
  final Function()? onTap;
  final Offset? topLeftOffset;
  final Offset? bottomRightOffset;
  final double? borderWidth;
  final Color? borderColor;

  const Neomorphic({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.boxShape,
    this.bottomRightShadowColor,
    this.topLeftShadowColor,
    this.bottomRightShadowBlurRadius,
    this.bottomRightShadowSpreadRadius,
    this.topLeftShadowBlurRadius,
    this.topLeftShadowSpreadRadius,
    this.onTap,
    this.borderWidth,
    this.borderColor,
    this.topLeftOffset,
    this.bottomRightOffset,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        shape: boxShape ?? BoxShape.rectangle,
        boxShadow: [
          //bottomRightShadowProperties
          BoxShadow(
            color: bottomRightShadowColor ?? theme.colorScheme.shadow,
            //x and y coordinates of shadow
            offset: bottomRightOffset ?? const Offset(10, 10),
            // how many pixels on the screen blend into each other; thus, a larger value will create more blur.
            blurRadius: bottomRightShadowBlurRadius ?? 20,
            // positive values will cause the shadow to expand and grow bigger, negative values will cause the shadow to shrink
            spreadRadius: bottomRightShadowSpreadRadius ?? 1,
          ),
          //topLEftShadowProperties
          BoxShadow(
            color: topLeftShadowColor ?? theme.highlightColor,
            //x and y coordinates of shadow
            offset: topLeftOffset ?? const Offset(-10, -10),
            // how many pixels on the screen blend into each other; thus, a larger value will create more blur.
            blurRadius: topLeftShadowBlurRadius ?? 20,
            // positive values will cause the shadow to expand and grow bigger, negative values will cause the shadow to shrink
            spreadRadius: topLeftShadowSpreadRadius ?? 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
