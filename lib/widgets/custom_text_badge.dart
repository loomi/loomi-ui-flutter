import 'package:flutter/cupertino.dart';

class CustomTextBadge extends StatefulWidget {
  final Color color;
  final Color? textColor;
  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double? radius;
  final double? width;
  final double? height;
  final bool? expanded;

  const CustomTextBadge({
    super.key,
    required this.color,
    required this.text,
    this.textStyle,
    this.textColor,
    this.padding,
    this.radius,
    this.width,
    this.height,
    this.expanded,
  });

  @override
  State<CustomTextBadge> createState() => _CustomTextBadgeState();
}

class _CustomTextBadgeState extends State<CustomTextBadge> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize:
          widget.expanded == true ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Container(
          width: widget.width ?? 120,
          height: widget.height ?? 60,
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(
              widget.radius ?? 44,
            ),
          ),
          child: Center(
            child: Padding(
              padding: widget.padding ??
                  const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: widget.textStyle ??
                    TextStyle(
                      color: widget.textColor ?? widget.color,
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
