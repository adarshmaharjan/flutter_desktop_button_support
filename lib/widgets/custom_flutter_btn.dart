import 'package:flutter/material.dart';

class CustomFlutterBtn extends StatefulWidget {
  final bool isTransformable;
  const CustomFlutterBtn({
    Key? key,
    this.isTransformable = false,
  }) : super(key: key);

  @override
  State<CustomFlutterBtn> createState() => _CustomFlutterBtnState();
}

class _CustomFlutterBtnState extends State<CustomFlutterBtn> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity().scaled(1.1);
    final transform = isHovered ? hoverTransform : Matrix4.identity();
    buttonColorFunc() {
      Color btnColor = Colors.white;
      if (isHovered) {
        btnColor = Colors.redAccent;
      } else {
        btnColor = Colors.blueAccent;
      }
      if (isPressed) {
        btnColor = Colors.red;
      } else if (isHovered) {
        btnColor = Colors.blue;
      }
      return btnColor;
    }

    return SizedBox(
      width: 200,
      height: 50,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => onEntered(true),
        onExit: (event) => onExit(false),
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isPressed ? Colors.red : Colors.blue,
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: widget.isTransformable ? transform : null,
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
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
              onTap: () {},
              child: const Text('Custom Flutter Btn'),
            ),
          ),
        ),
      ),
    );
  }

  void onEntered(bool isHovered) {
    debugPrint("is hovered");
    setState(() {
      this.isHovered = isHovered;
    });
  }

  void onExit(bool isHovered) {
    debugPrint("is exited hover");
    setState(() {
      this.isHovered = isHovered;
      isPressed = false;
    });
  }
}
