import 'package:flutter/material.dart';

class LoomiCustomLabel extends StatelessWidget {
  final String? text;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Widget? sufix;
  final Widget? prefix;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final BoxBorder? border;
  const LoomiCustomLabel({
    super.key,
    this.text,
    this.padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    this.backgroundColor,
    this.sufix,
    this.prefix,
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.border,
    this.width = 78,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
        border: border,
      ),
      child: Row(
        mainAxisAlignment: text != null && (sufix != null || prefix != null)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (prefix != null) prefix!,
          if (text != null)
            Text(
              text!,
              style: textStyle ?? Theme.of(context).textTheme.titleSmall,
            ),
          if (sufix != null) sufix!,
        ],
      ),
    );
  }
}
