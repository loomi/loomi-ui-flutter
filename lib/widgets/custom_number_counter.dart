import 'package:flutter/material.dart';

class CustomNumberCounter extends StatefulWidget {
  final int counter;
  final int maxNumber;
  final int minNumber;
  final Function(int)? onChanged;
  final TextStyle? counterTextStyle;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final BoxBorder? mainBorder;
  final double counterWidth;
  final double counterHeight;
  final Size? addIconSize;
  final Size? subIconSize;
  final Color? addIconColor;
  final Color? subIconColor;
  final Color? mainColor;
  final double? borderRadius;
  final double? mainBorderRadius;

  const CustomNumberCounter({
    super.key,
    required this.counter,
    this.onChanged,
    this.mainBorder,
    this.minNumber = 1,
    this.counterTextStyle,
    this.mainColor,
    this.addIconSize,
    this.subIconSize,
    this.counterHeight = 50,
    this.counterWidth = 100,
    this.border,
    this.maxNumber = 9999,
    this.addIconColor,
    this.subIconColor,
    this.borderRadius,
    this.mainBorderRadius,
    this.padding,
  });

  @override
  State<CustomNumberCounter> createState() => _CustomNumberCounterState();
}

class _CustomNumberCounterState extends State<CustomNumberCounter> {
  int counter = 0;
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    counter = widget.counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (counter > 0) {
                    counter -= 1;
                  }
                });
                if (widget.onChanged != null) widget.onChanged!(counter);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: widget.border ??
                      Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.remove,
                    color: widget.subIconColor,
                    size: widget.subIconSize != null
                        ? widget.subIconSize!.width
                        : 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: widget.counterWidth,
            height: widget.counterHeight,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(widget.mainBorderRadius ?? 16),
              color: widget.mainColor,
              border: widget.mainBorder,
            ),
            child: Center(
              child: Padding(
                padding:
                    widget.padding ?? const EdgeInsets.fromLTRB(40, 12, 40, 12),
                child: Text(
                  widget.counter.toString(),
                  style: widget.counterTextStyle,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  counter += 1;
                });
                if (widget.onChanged != null) widget.onChanged!(counter);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: widget.border ??
                      Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.add,
                    color: widget.addIconColor,
                    size: widget.addIconSize != null
                        ? widget.addIconSize!.width
                        : 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
