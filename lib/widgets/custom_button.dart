import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final bool? isLoading;
  final Color? backgroundColor;
  final String text;
  final TextStyle? buttonTextStyle;
  final Widget? prefix;
  final Widget? sufix;
  final int? counter;
  final Color? counterBackgroundColor;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final double buttonHeight;
  final Function()? onLongPress;
  final BoxBorder? border;
  final TextStyle? counterTextStyle;
  final EdgeInsets padding;
  final double? buttonWidth;
  final double? counterRadius;
  final bool expanded;

  const CustomButton({
    super.key,
    this.isLoading,
    this.counterTextStyle,
    this.buttonWidth,
    this.backgroundColor,
    this.expanded = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.buttonHeight = 66,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.counterBackgroundColor,
    this.counterRadius = 15,
    this.counter,
    this.sufix,
    this.border,
    this.prefix,
    this.onTap,
    this.onLongPress,
    required this.text,
    this.buttonTextStyle,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPress,
      onTap: widget.onTap,
      child: Container(
        width: widget.buttonWidth,
        padding: widget.padding,
        height: widget.buttonHeight,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Theme.of(context).primaryColor,
          border: widget.border,
          borderRadius: widget.borderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: widget.expanded ? MainAxisSize.max : MainAxisSize.min,
          children: [
            if (widget.prefix != null) widget.prefix!,
            if (widget.prefix != null ||
                widget.sufix != null ||
                widget.counter != null)
              Expanded(
                child: Container(),
              ),
            Text(
              widget.text,
              style: widget.buttonTextStyle ??
                  Theme.of(context).textTheme.headline6,
            ),
            if (widget.prefix != null ||
                widget.sufix != null ||
                widget.counter != null)
              Expanded(
                child: Container(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.counter != null)
                  CircleAvatar(
                    backgroundColor: widget.counterBackgroundColor,
                    radius: widget.counterRadius,
                    child: Text(
                      widget.counter.toString(),
                      style: widget.counterTextStyle ??
                          Theme.of(context).textTheme.headline6,
                    ),
                  ),
                if (widget.sufix != null)
                  ...[
                    const SizedBox(
                      width: 5,
                    ),
                    widget.sufix!
                  ].toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
