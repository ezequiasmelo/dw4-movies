import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final bool outlined;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const AppButtonWidget(
      {Key? key,
      required this.child,
      this.width = double.infinity,
      this.height = 44.0,
      this.onPressed,
      this.outlined = false,
      this.backgroundColor,
      this.foregroundColor})
      : super(key: key);

  Widget get outlinedButton {
    return OutlinedButton(
        child: child,
        style: OutlinedButton.styleFrom(
          primary: backgroundColor,
        ),
        onPressed: onPressed);
  }

  Widget get elevatedButton {
    return ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
            primary: backgroundColor, onPrimary: foregroundColor),
        onPressed: onPressed);
  }

  @override
  Widget build(BuildContext context) {
    final button = outlined ? outlinedButton : elevatedButton;

    return SizedBox(width: width, height: height, child: button);
  }
}
