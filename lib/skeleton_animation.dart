 import 'package:flutter/material.dart';

/// Different animations for the skeleton object
///
/// Default is the pulse animation
enum SkeletonAnimation {
  /// Static color
  none,

  /// Simple fadeing animation
  pulse
}

/// Different styles of the skeleton
enum SkeletonStyle {
  /// A simple box
  box,

  /// A simple circle
  ///
  /// The width and height will be the same
  circle,

  /// A box with rounded corners
  text
}

/// Creates a simple skeleton animation
///
/// If you want the skeleton to look like text, you can use [SkeletonStyle.text]
class SkeletonAnimationDecoration extends StatefulWidget {
  final Widget child;
  /// The text color
  final Color? textColor;

  /// The width of the skeleton
  final double width;

  /// The height of the skeleton
  ///
  /// Height is ignored if the [style] is [SkeletonStyle.circle]
  final double height;

  /// The padding of the object
  final double padding;

  /// Choose your style of animaion.
  /// The default is [SkeletonAnimation.pulse]
  final SkeletonAnimation animation;

  /// Change the duration of the animation
  ///
  /// For [SkeletonAnimation.pulse] it is 750 milliseconds
  final Duration? animationDuration;

  /// Choose your look of the skeleton
  /// The default is [SkeletonStyle.box]
  final SkeletonStyle style;

  /// Add a border around the skeleton
  final BoxBorder? border;

  /// Choose a custom border radius
  final BorderRadiusGeometry? borderRadius;

  /// Everything could be null but we recommend changing the height and the style
  ///
  /// If you want to create a text skelelton you can use [SkeletonText]
  SkeletonAnimationDecoration({
    Key? key,
    required this.child,
    // Use default colors
    this.textColor,
    // Use default size
    this.width = 200.0,
    this.height = 60.0,
    this.padding = 0,
    // Use the default animation
    this.animation = SkeletonAnimation.pulse,
    this.animationDuration,
    // Use the default style
    this.style = SkeletonStyle.box,
    // Add border support
    this.border,
    this.borderRadius,
  }): super(key: key);

  @override
  SkeletonState createState() => SkeletonState();
}

class SkeletonState extends State<SkeletonAnimationDecoration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Create the correct animation
    if (widget.animation == SkeletonAnimation.pulse) {
      // Create the pulse animation
      _controller = AnimationController(
        // Use the correct duration
        duration: widget.animationDuration ?? Duration(milliseconds: 750),
        reverseDuration:
            widget.animationDuration ?? Duration(milliseconds: 750),
        // Default settings
        vsync: this,
        lowerBound: .4,
        upperBound: 1,
      )..addStatusListener((AnimationStatus status) {
          // Create a loop
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        });

      // Start the animation
      _controller.forward();
    } else {
      // Create a dummy animation
      _controller = AnimationController(
        vsync: this,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: (widget.animation == SkeletonAnimation.pulse)
            ? _controller.value
            : 1,
        child: Container(
          child:  widget.child,
        ),
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
