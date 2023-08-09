import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.textInLine,
    this.centerTitle = true,
    this.backgroundColor,
    this.leading,
    this.onTapPrefix,
    this.styleTitle,
    this.trealing,
    this.padding,
    this.titlePadding,
    this.margin,
    this.verticalMarginTitle,
    this.shadowColor,
    this.elevation,
    this.shadowValue,
  }) : super(key: key);
  final Color? backgroundColor;
  final Widget? leading;
  final Function()? onTapPrefix;
  final String title;
  final TextStyle? styleTitle;
  final bool centerTitle;
  final List<Widget>? trealing;
  final double? padding;
  final double? titlePadding;
  final double? margin;
  final bool textInLine;
  final double? verticalMarginTitle;
  final Color? shadowColor;
  final double? shadowValue;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.all(margin ?? 0),
        padding: EdgeInsets.all(padding ?? 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? Colors.grey,
              blurRadius: shadowValue ?? 8,
              spreadRadius: elevation ?? 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: !textInLine && centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (leading != null)
                  GestureDetector(
                    onTap: onTapPrefix,
                    child: leading,
                  ),
                if (textInLine)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: centerTitle
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: titlePadding ?? 0,
                            right: titlePadding ?? 0,
                          ),
                          child: Text(
                            title,
                            style: styleTitle ??
                                const TextStyle(
                                    fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (!textInLine) const Spacer(),
                if (trealing != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: trealing!,
                  ),
              ],
            ),
            if (!textInLine)
              SizedBox(
                height: verticalMarginTitle ?? 0,
              ),
            if (!textInLine)
              Text(
                title,
                style: styleTitle ??
                    const TextStyle(fontSize: 16, color: Colors.black),
              ),
          ],
        ),
      ),
    );
  }
}
