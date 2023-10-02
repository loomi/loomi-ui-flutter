import 'package:flutter/material.dart';

class CustomAlertComponent extends StatelessWidget {
  final String? title;
  final String? content;
  final IconData? prefixIcon;
  final Color? containerColor;
  final double? containerHeight;
  final double? containerWidth;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? iconContainerColor;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final Color? iconColor;

  const CustomAlertComponent({
    super.key,
    this.title,
    this.content,
    this.prefixIcon,
    this.containerColor,
    this.containerHeight,
    this.containerWidth,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.iconContainerColor,
    this.titleStyle,
    this.contentStyle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: containerWidth ?? double.infinity,
        maxHeight: containerHeight ?? double.infinity,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: containerColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        border: Border.all(
          color: borderColor ?? Colors.black,
          width: borderWidth ?? 1.0,
        ),
      ),
      child: Row(
        children: [
          prefixIcon != null
              ? Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: iconContainerColor ?? Colors.grey[200],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    prefixIcon,
                    size: 16.0,
                    color: iconColor,
                  ),
                )
              : Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      title!,
                      style: titleStyle ??
                          const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                if (content != null) Text(content!, style: contentStyle),
              ],
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
