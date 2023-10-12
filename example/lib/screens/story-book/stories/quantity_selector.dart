import 'package:flutter/material.dart';

import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

int currentAmount = 2;

final TextEditingController _controller = TextEditingController(text: "2");

Story quantitySelectorStory = Story(
  name: 'Quantity Selector',
  description: 'A Quantity Selector',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 50,
      child: CustomQuantitySelector(
        currentAmount: currentAmount,
        minimumItems: 1,
        controller: _controller,
        onMinus: () {
          currentAmount = currentAmount - 1;
          _controller.text = currentAmount.toString();
        },
        onChanged: (value) {
          int? newVal = int.tryParse(value ?? "0");

          currentAmount = newVal ?? 0;
        },
        onPlus: () {
          currentAmount = currentAmount + 1;
          _controller.text = currentAmount.toString();
        },
        subIconColor: Colors.green,
        addIconColor: Colors.green,
      ),
    ),
  ),
);
