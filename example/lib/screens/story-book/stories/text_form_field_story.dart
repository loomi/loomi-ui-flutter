import 'package:flutter/material.dart';

import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story textFormFieldStory = Story(
  name: 'LoomiTextFormField',
  description: 'A Custom TextFormField',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CustomTextFormField(
            labelText: "Label Text",
            hintText: "Hint Text",
            borderRadius: doubleSliderOptions(context, label: "Border Radius"),
            padding: EdgeInsets.symmetric(
              vertical: doubleSliderOptions(
                context,
                label: "Vertical Padding",
                initial: 30,
              ),
              horizontal: doubleSliderOptions(
                context,
                label: "Horizontal Padding",
                initial: 16,
              ),
            ),
            inputBorder: inputBorderOptions(context, label: "Input Border"),
            backgroundColor: colorOptions(context, label: "Fill Color"),
            filled: booleanOption(context, label: "Is Filled"),
            isPassword: booleanOption(context, label: "Is Password"),
            initialValue: 'Initial Value Here',
            prefixIcon: iconsOptions(
              context,
              label: "Widget Prefix",
              enabled: false,
            ),
            suffixIcon: iconsOptions(
              context,
              label: "Widget Sufix",
              enabled: false,
            ),
            labelAlignment: alignOptions(context, label: "Label Alignment"),
          ),
        ),
      ],
    ),
  ),
);
