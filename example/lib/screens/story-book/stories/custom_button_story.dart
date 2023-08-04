import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story customButtonStory = Story(
  name: 'Custom Button',
  description: 'A Custom Button',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: CustomButton(
      backgroundColor: colorOptions(context, label: "Background Color"),
      expanded: booleanOption(
        context,
        label: "Is Expanded",
        description: "Expand Button to Max Size Possible",
      ),
      borderRadius: doubleSliderOptions(context, label: "Border Radius"),
      padding: EdgeInsets.symmetric(
        vertical: doubleSliderOptions(
          context,
          label: "Vertical Padding",
          initial: 8,
        ),
        horizontal: doubleSliderOptions(
          context,
          label: "Horizontal Padding",
          initial: 16,
        ),
      ),
      prefix: iconsOptions(
        context,
        label: "Widget Prefix",
        enabled: false,
      ),
      sufix: iconsOptions(
        context,
        label: "Widget Sufix",
        enabled: false,
      ),
      buttonHeight: doubleSliderOptions(
        context,
        label: "Button Height",
        initial: 66,
        max: 300,
        min: 40,
      ),
      border: borderOptions(context, label: "Button Border"),
      text: "Teste de botão!",
      isLoading: booleanOption(
        context,
        label: "Is Loading",
        initial: false,
      ),
    ),
  ),
);
