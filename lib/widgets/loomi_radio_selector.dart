import 'package:flutter/material.dart';

class RadioSelector extends StatelessWidget {
  final bool selected;
  final Function() onTap;
  final double radius;
  final String text;
  final String? trailingText;
  final Widget? leading;
  final double padding;
  final bool showShadow;
  final double heigth;
  final bool showSelectedGradient;
  final TextStyle? textStyle;
  final Color selectedCheckColor;
  final TextStyle? trailingTextStyle;
  final Color? backgroundColor;

  const RadioSelector({
    required this.onTap,
    required this.text,
    this.selectedCheckColor = Colors.white,
    this.trailingText,
    this.leading,
    this.selected = false,
    this.showShadow = true,
    this.radius = 24,
    this.padding = 24,
    this.showSelectedGradient = true,
    this.heigth = 75,
    this.textStyle,
    this.trailingTextStyle,
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heigth,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    blurRadius: 14,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(
                      .1,
                    ),
                  )
                ]
              : null,
          borderRadius: BorderRadius.circular(radius),
          gradient: showSelectedGradient
              ? LinearGradient(
                  colors: [
                    selected
                        ? backgroundColor ??
                            Theme.of(context).colorScheme.primary
                        : Colors.white,
                    selected
                        ? (backgroundColor ??
                                Theme.of(context).colorScheme.primary)
                            .withAlpha(125)
                        : Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            children: [
              if (leading != null)
                Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.only(right: 24),
                  child: leading!,
                ),
              Expanded(
                flex: 2,
                child: Text(
                  text,
                  style: textStyle ??
                      Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: selected
                                ? Colors.white
                                : const Color(0xff484848),
                          ),
                ),
              ),
              if (!selected && trailingText != null)
                Expanded(
                  child: Text(
                    trailingText!,
                    textAlign: TextAlign.end,
                    style: trailingTextStyle ??
                        Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: selected
                                  ? Colors.white
                                  : const Color(0xff484848),
                            ),
                  ),
                ),
              selected
                  ? Container(
                      margin: const EdgeInsets.only(left: 24),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: selectedCheckColor,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: selectedCheckColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(left: 24),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xfffbfbfb),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xffdbdbdb),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
