import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomQuantitySelector extends StatefulWidget {
  final Function() onMinus;
  final Function() onPlus;
  final Function(String?) onChanged;
  final int currentAmount;
  final int minimumItems;
  final TextEditingController controller;
  final Size? addIconSize;
  final Size? subIconSize;
  final Color? addIconColor;
  final Color? subIconColor;
  final String? text;

  const CustomQuantitySelector({
    super.key,
    required this.onMinus,
    required this.onPlus,
    required this.onChanged,
    required this.currentAmount,
    required this.minimumItems,
    required this.controller,
    this.addIconSize,
    this.subIconSize,
    this.addIconColor,
    this.subIconColor,
    this.text,
  });

  @override
  State<CustomQuantitySelector> createState() => _CustomQuantitySelectorState();
}

class _CustomQuantitySelectorState extends State<CustomQuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.text ?? "Quantidade",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(
                0.08,
              ),
              width: 1,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      widget.onMinus();
                    },
                    child: Icon(
                      Icons.remove,
                      color: widget.currentAmount == widget.minimumItems
                          ? Colors.grey
                          : widget.subIconColor,
                      size: widget.subIconSize != null
                          ? widget.subIconSize!.width
                          : 18,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 50,
                    height: kIsWeb ? 8 : 25,
                    child: TextFormField(
                      controller: widget.controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      onChanged: (value) => widget.onChanged(value),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      widget.onPlus();
                    },
                    child: Icon(
                      Icons.add,
                      color: widget.addIconColor,
                      size: widget.addIconSize != null
                          ? widget.addIconSize!.width
                          : 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
