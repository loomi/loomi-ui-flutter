import 'package:flutter/material.dart';

import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story checkBoxStory = Story(
  name: 'Custom CheckBox',
  description: 'A Custom CheckBox',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: CustomCheckbox(
      true,
      uncheckedBackgroundColor: colorOptions(
        context,
        label: "Unchecked Background Color",
        initial: Colors.white,
      ),
      checkColor: colorOptions(
            context,
            label: "Check Color",
            initial: Colors.teal,
          ) ??
          Colors.transparent,

      borderRadius: BorderRadius.circular(
        doubleSliderOptions(
          context,
          label: "Border Radius",
          enabled: false,
        ),
      ),
      iconSize: doubleSliderOptions(
        context,
        label: "Icon Size",
        initial: 20,
        enabled: false,
      ),
      iconColor: colorOptions(
            context,
            label: "Icon Color",
          ) ??
          Colors.transparent,
      showIcon: booleanOption(
        context,
        label: "Show Icon",
        initial: false,
        enabled: false,
      ),

      checkboxPadding: EdgeInsets.symmetric(
        vertical: doubleSliderOptions(
          context,
          label: "Checkbox Vertical Padding",
          initial: 8,
          enabled: false,
        ),
        horizontal: doubleSliderOptions(
          context,
          label: "Checkbox Horizontal Padding",
          initial: 16,
          enabled: false,
        ),
      ),
      // iconPadding: EdgeInsets.symmetric(
      //   vertical: doubleSliderOptions(
      //     context,
      //     label: "Icon Vertical Padding",
      //     initial: 8,
      //     enabled: false,
      //   ),
      //   horizontal: doubleSliderOptions(
      //     context,
      //     label: "Icon Horizontal Padding",
      //     initial: 16,
      //     enabled: false,
      //   ),
      // ),
      label: "Label here",
    ),
  ),
);
