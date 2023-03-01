import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loomi_ui_flutter/utils/custom_icons.dart';
import 'package:loomi_ui_flutter/widgets/get_icon.dart';

class NumberCounter extends StatefulWidget {
  final int counter;
  final int maxNumber;
  final Function(int)? onChanged;
  final TextStyle? counterTextStyle;
  final EdgeInsets padding;
  final BoxBorder? border;
  final double counterWidth;
  final double counterHeight;
  final Size? addIconSize;
  final Size? subIconSize;
  final Color? addIconColor;
  final Color? subIconColor;
  final BorderRadius? borderRadius;

  const NumberCounter({
    super.key,
    required this.counter,
    this.onChanged,
    this.counterTextStyle,
    this.addIconSize,
    this.subIconSize,
    this.counterHeight = 60,
    this.counterWidth = 100,
    this.border,
    this.maxNumber = 9999,
    this.addIconColor,
    this.subIconColor,
    this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  State<NumberCounter> createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: GetIcon(
              CustomIcons.subIcon,
              width:
                  widget.subIconSize != null ? widget.subIconSize!.width : 18,
              heigth:
                  widget.subIconSize != null ? widget.subIconSize!.height : 18,
              color: widget.subIconColor ?? Theme.of(context).primaryColor,
            ),
            onTap: () {
              setState(() {
                if (counter > 0) {
                  counter -= 1;
                }
              });
              if (widget.onChanged != null) widget.onChanged!(counter);
            },
          ),
          const SizedBox(width: 10),
          Container(
            width: widget.counterWidth,
            height: widget.counterHeight,
            decoration: BoxDecoration(
              border: widget.border ??
                  Border.all(color: Theme.of(context).primaryColor, width: 1),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                counter.toString(),
                maxLines: 1,
                style: widget.counterTextStyle ??
                    Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SizedBox(
            width: 0,
            height: 0,
            child: TextFormField(
              onChanged: (value) {
                String aux = value;
                if (aux.isEmpty) {
                  aux = "0";
                }
                if (int.parse(aux) < widget.maxNumber) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(int.parse(aux));
                  }
                  setState(() {
                    counter = int.parse(aux);
                  });
                }
              },
              controller: controller,
              keyboardType: TextInputType.number,
              focusNode: focusNode,
              inputFormatters: [
                LengthLimitingTextInputFormatter(
                  widget.maxNumber.toString().length,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            child: GetIcon(
              CustomIcons.addIcon,
              width:
                  widget.addIconSize != null ? widget.addIconSize!.width : 18,
              heigth:
                  widget.addIconSize != null ? widget.addIconSize!.height : 18,
              color: widget.addIconColor ?? Theme.of(context).primaryColor,
            ),
            onTap: () {
              setState(() {
                counter += 1;
              });
              if (widget.onChanged != null) widget.onChanged!(counter);
            },
          )
        ],
      ),
    );
  }
}
