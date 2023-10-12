import 'package:flutter/material.dart';

enum CheckType { icon, container }

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color? iconColor;
  final double size;
  final double borderRadius;
  final CheckType checkType;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final Color activeBorderColor;
  final Color inactiveBorderColor;

  const CustomCheckBox({
    Key? key,
    required this.isChecked,
    this.onChanged,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.size = 24.0,
    this.borderRadius = 4.0,
    this.checkType = CheckType.icon,
    this.labelText,
    this.labelTextStyle,
    this.activeBorderColor = Colors.black,
    this.inactiveBorderColor = Colors.black,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            onChanged?.call(!isChecked);
          },
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: isChecked
                  ? checkType == CheckType.icon
                      ? activeColor
                      : inactiveColor
                  : inactiveColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: isChecked ? activeBorderColor : inactiveBorderColor,
              ),
            ),
            child: Center(
              child: isChecked
                  ? checkType == CheckType.icon
                      ? Icon(
                          Icons.check,
                          color: iconColor,
                          size: size / 2,
                        )
                      : Container(
                          width: size / 1.35,
                          height: size / 1.35,
                          decoration: BoxDecoration(
                            color: activeColor,
                            borderRadius: BorderRadius.circular(
                              borderRadius,
                            ),
                          ),
                        )
                  : null,
            ),
          ),
        ),
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              labelText!,
              style: labelTextStyle ?? const TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }
}
