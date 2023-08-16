import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.widgetInLine = true,
    this.centerTitle = true,
    this.backgroundColor,
    this.leading,
    this.onTapPrefix,
    this.styleTitle,
    this.trealing,
    this.padding,
    this.margin,
    this.verticalMarginTitle,
    this.boxShadow,
  }) : super(key: key);
  final Color? backgroundColor;
  final Widget? leading;
  final Function()? onTapPrefix;
  final Widget title;
  final TextStyle? styleTitle;
  final bool centerTitle;
  final List<Widget>? trealing;
  final double? padding;
  final double? margin;

  ///Define position the title widget in row or column
  final bool widgetInLine;
  final double? verticalMarginTitle;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.all(margin ?? 0),
        padding: EdgeInsets.all(padding ?? 12),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          boxShadow: boxShadow,
        ),
        child: Column(
          crossAxisAlignment: !widgetInLine && centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (leading != null)
                  GestureDetector(
                    onTap: onTapPrefix,
                    child: leading,
                  )
                else
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                if (widgetInLine)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: centerTitle
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        title,
                      ],
                    ),
                  ),
                if (!widgetInLine) const Spacer(),
                if (trealing != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: trealing!,
                  ),
              ],
            ),
            if (!widgetInLine)
              SizedBox(
                height: verticalMarginTitle ?? 0,
              ),
            if (!widgetInLine) title
          ],
        ),
      ),
    );
  }
}
