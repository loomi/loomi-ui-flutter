import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/utils/custom_icons.dart';
import 'package:loomi_ui_flutter/widgets/get_icon.dart';

class CustomCheckbox extends StatefulWidget {
  final bool check;
  final Color? uncheckedBackgroundColor;
  final Color? checkColor;
  final BorderRadius? borderRadius;
  final BoxBorder? checkedOuterBorder;
  final BoxBorder? outerBorder;
  final double checkboxHeight;
  final double checkboxWidth;
  final Color iconColor;
  final bool showIcon;
  final BoxBorder? uncheckedOuterBorder;
  final TextStyle? textStyle;
  final String? label;
  final double? iconSize;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets? checkboxPadding;
  final EdgeInsets? iconPadding;
  final bool expandIcon;

  const CustomCheckbox(
    this.check, {
    super.key,
    this.expandIcon = false,
    this.checkboxPadding,
    this.showIcon = true,
    this.checkboxHeight = 18,
    this.checkboxWidth = 18,
    this.borderRadius,
    this.checkColor,
    this.iconColor = Colors.white,
    this.checkedOuterBorder,
    this.label,
    this.outerBorder,
    this.textStyle,
    this.boxShadow,
    this.iconPadding,
    this.uncheckedOuterBorder,
    this.uncheckedBackgroundColor,
    this.iconSize,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool checked = false;
  double checkboxHeight = 0;
  double checkboxWidth = 0;
  double backgroundWidth = 0;
  double backgroundHeight = 0;

  @override
  void initState() {
    checked = widget.check;
    setCheckBoxSizes();
    super.initState();
  }

  void setCheckBoxSizes() {
    checkboxHeight = widget.checkboxHeight;
    checkboxWidth = widget.checkboxWidth;

    if (widget.checkboxPadding != null) {
      var padding = widget.checkboxPadding!;
      backgroundWidth = checkboxWidth + padding.left + padding.right;
      backgroundHeight = checkboxHeight + padding.top + padding.bottom;
      if (checkboxWidth > backgroundWidth) {
        checkboxWidth = backgroundWidth;
      }
      if (checkboxHeight > backgroundHeight) {
        checkboxHeight = backgroundHeight;
      }
    } else {
      backgroundWidth = widget.checkboxWidth;
      backgroundHeight = widget.checkboxHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checked = !checked;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: widget.outerBorder,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(6),
          boxShadow: widget.boxShadow,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              padding: widget.checkboxPadding,
              width: backgroundWidth,
              height: backgroundHeight,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(6),
                color: widget.uncheckedBackgroundColor ??
                    Theme.of(context).unselectedWidgetColor,
                border: checked
                    ? widget.checkedOuterBorder
                    : widget.uncheckedOuterBorder,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
                width: checkboxWidth,
                height: checkboxHeight,
                decoration: BoxDecoration(
                  color: checked
                      ? widget.checkColor ?? Theme.of(context).primaryColor
                      : widget.uncheckedBackgroundColor ??
                          Theme.of(context).unselectedWidgetColor,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(6),
                ),
                child: Center(
                  child: checked && widget.showIcon
                      ? Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: widget.iconPadding ??
                                      const EdgeInsets.all(0),
                                  child: GetIcon(
                                    CustomIcons.checkIcon,
                                    width: widget.iconSize,
                                    color: widget.iconColor,
                                    heigth: widget.iconSize,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
            if (widget.label != null) const SizedBox(width: 10),
            if (widget.label != null)
              Text(
                widget.label!,
                style:
                    widget.textStyle ?? Theme.of(context).textTheme.titleLarge,
              ),
          ],
        ),
      ),
    );
  }
}
