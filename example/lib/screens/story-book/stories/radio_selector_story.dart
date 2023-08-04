import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story radioSelectorStory = Story(
  name: 'Custom Radio Selector',
  description: 'A Custom Radio Selector',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RadioSelector(
          backgroundColor: colorOptions(context, label: "Background Color"),
          selectedCheckColor:
              colorOptions(context, label: "Selected Check Color"),
          showSelectedGradient: booleanOption(
            context,
            label: "Show Selected Gradient",
            initial: true,
          ),
          showShadow: booleanOption(context, label: "Show Shadow"),
          leading: iconsOptions(
            context,
            label: "Leading",
            enabled: false,
          ),
          selected: booleanOption(context, label: "Is Selected"),
          text: "Label",
          onTap: () {},
        ),
      ],
    ),
  ),
);
