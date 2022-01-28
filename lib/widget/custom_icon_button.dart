import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final void Function() onPressed;
  final backgroundColor;
  final double radious;
  final Color borderColor;
  final EdgeInsets margin;
  final double elevation;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.radious = 8,
    this.borderColor = Colors.transparent,
    required this.margin,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radious),
          side: BorderSide(width: 0.7, color: borderColor)),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
      ),
    );
  }
}
