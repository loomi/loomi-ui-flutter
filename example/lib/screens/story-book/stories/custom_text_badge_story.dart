import 'package:flutter/material.dart';

import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story customTextBadgeStory = Story(
  name: 'Custom Text Badge Story',
  description: 'A Custom Text Badge Story',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: CustomTextBadge(
      text: 'Text Badge',
      color: colorOptions(
        context,
        label: "Main Color",
        initial: Colors.red,
      ),
      height: doubleSliderOptions(context, label: "Height", initial: 65),
      width: doubleSliderOptions(
        context,
        label: "Width",
        initial: 120,
        max: 300,
      ),
      radius: doubleSliderOptions(
        context,
        label: "Radius",
        initial: 32,
      ),
      textColor: colorOptions(
        context,
        label: "Text Color",
        initial: Colors.red,
      ),
    ),
  ),
);
