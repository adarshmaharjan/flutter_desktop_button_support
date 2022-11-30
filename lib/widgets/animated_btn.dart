import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget child;

  const CustomButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  build(context) {
    return GestureDetector(
      onTapDown: (TapDownDetails tapDownDetails) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (TapUpDetails tapUpDetails) {
        setState(() {
          isPressed = false;
        });
      },
      child: TweenAnimationBuilder(
        tween: isPressed
            ? ColorTween(
                begin: CupertinoColors.destructiveRed,
                end: CupertinoColors.systemYellow)
            : ColorTween(
                begin: CupertinoColors.systemYellow,
                end: CupertinoColors.destructiveRed),
        duration: Duration(milliseconds: 600),
        builder: (_context, Color? color, Widget? child) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: CupertinoColors.inactiveGray,
              ),
              color: color, // This color is animated
            ),
            child: Center(child: child),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(bottom: 16.0),
          );
        },
        child: widget.child,
      ),
    );
  }
}
