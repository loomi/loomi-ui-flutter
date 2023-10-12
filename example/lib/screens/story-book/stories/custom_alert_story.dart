import 'package:flutter/material.dart';

import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:loomi_ui_flutter/widgets/custom_alert.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story customAlertStory = Story(
  name: 'Custom Alert',
  description: 'A Custom Alert Component',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomAlertComponent(
          title: 'Title',
          content: "We've create your account for bla...",
          prefixIcon: Icons.check,
          containerColor: colorOptions(
            context,
            label: "Container Color",
            initial: Colors.green,
          ),
          borderRadius: doubleSliderOptions(
            context,
            label: "Border Radius",
            initial: 12,
            min: 0,
            max: 50,
          ),
          borderWidth: doubleSliderOptions(
            context,
            label: "Border Width",
            initial: 2,
            min: 0,
            max: 10,
          ),
          borderColor: colorOptions(
            context,
            label: "Border Color",
            initial: Colors.transparent,
          ),
          iconContainerColor: colorOptions(
            context,
            label: "Icon Container Color",
            initial: Colors.white,
          ),
          titleStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
          contentStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          iconColor: colorOptions(
            context,
            label: "Icon Color",
            initial: Colors.green,
          ),
        ),
      ],
    ),
  ),
);
