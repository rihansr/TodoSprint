import 'package:flutter/material.dart';

const BoxConstraints _kMiniSizeConstraints = BoxConstraints.tightFor(
  width: 52.0,
  height: 52.0,
);

const BoxConstraints _kSizeConstraints = BoxConstraints.tightFor(
  width: 68.0,
  height: 68.0,
);

class DiamondFab extends StatefulWidget {
  final Widget child;
  final double notchMargin;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final String? tooltip;
  final VoidCallback onPressed;
  final Object heroTag;
  final double highlightElevation;
  final bool mini;

  final BoxConstraints _sizeConstraints;

  const DiamondFab({
    super.key,
    required this.child,
    this.notchMargin = 8.0,
    this.backgroundColor,
    required this.onPressed,
    this.foregroundColor,
    this.tooltip,
    this.heroTag = const _DefaultHeroTag(),
    this.highlightElevation = 12.0,
    this.mini = false,
    this.elevation = 6.0,
  }) : _sizeConstraints = mini ? _kMiniSizeConstraints : _kSizeConstraints;

  @override
  DiamondFabState createState() => DiamondFabState();
}

class DiamondFabState extends State<DiamondFab> {
  bool _hightlight = false;
  late VoidCallback _notchChange;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color foregroundColor =
        widget.foregroundColor ?? theme.colorScheme.primary;
    Widget result;

    result = IconTheme.merge(
      data: IconThemeData(
        color: foregroundColor,
      ),
      child: widget.child,
    );

    final Widget tooltip = Tooltip(
      message: widget.tooltip,
      child: result,
    );
    result = widget.child != null ? tooltip : SizedBox.expand(child: tooltip);

    result = RawMaterialButton(
      onPressed: widget.onPressed,
      onHighlightChanged: _handleHightlightChanged,
      elevation: _hightlight ? widget.highlightElevation : widget.elevation,
      constraints: widget._sizeConstraints,
      fillColor: widget.backgroundColor ?? theme.colorScheme.secondary,
      textStyle: theme.textTheme.labelLarge?.copyWith(
        color: foregroundColor,
        letterSpacing: 1.2,
      ),
      shape: _DiamondBorder(),
      child: result,
    );

    result = Hero(
      tag: widget.heroTag,
      child: result,
    );

    return result;
  }

  @override
  void deactivate() {
    _notchChange();
    super.deactivate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //_notchChange =
    //    Scaffold.setFloatingActionButtonNotchFor(context, _computeNotch);
  }

  // Draws the Notch.
  void _handleHightlightChanged(bool value) {
    setState(() => _hightlight = value);
  }
}

class _DefaultHeroTag {
  const _DefaultHeroTag();
  @override
  String toString() => '<default FloatingActionButton tag>';
}

class _DiamondBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
