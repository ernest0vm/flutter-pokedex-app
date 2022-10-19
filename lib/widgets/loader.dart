import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class Loader extends StatefulWidget {
  const Loader({
    Key? key,
    this.size = 100,
    this.color,
  }) : super(key: key);

  final double size;
  final Color? color;

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (_, child) => Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        ),
        child: SvgPicture.asset(
          'assets/icons/pokeball-loader.svg',
          height: widget.size,
          width: widget.size,
          color: widget.color,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
