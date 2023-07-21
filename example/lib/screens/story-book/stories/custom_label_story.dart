import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story customLabelStory = Story(
  name: 'Custom Label',
  description: 'A Custom Label',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: LoomiCustomLabel(
      text: "Label",
      backgroundColor: colorOptions(context, label: "Background Color"),
      border: borderOptions(context, label: "Label Border"),
      borderRadius: BorderRadius.circular(
        doubleSliderOptions(context, label: "Border Radius"),
      ),
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
      width: doubleSliderOptions(
        context,
        label: "Label Width",
        initial: 200,
        max: 300,
        min: 30,
      ),
      height: doubleSliderOptions(
        context,
        label: "Label Height",
        initial: 30,
        max: 300,
        min: 30,
      ),
    ),
  ),
);
