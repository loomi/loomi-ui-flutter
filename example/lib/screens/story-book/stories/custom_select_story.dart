import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story customSelectStory = Story(
  name: 'Custom Select Widget',
  description: 'A Custom Select Widget',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomSelect(
          value: "RJ",
          onChanged: (value) {},
          labelStyle: TextStyle(
            color: colorOptions(context, label: "Label Text Color"),
          ),
          list: ["RN", "SP", "RJ"]
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              )
              .toList(),
          border: borderOptions(context, label: "Border"),
          hintText: "Hint text here",
          textStyle: Theme.of(context).textTheme.labelLarge,
          borderRadius: BorderRadius.circular(
            doubleSliderOptions(context, label: "Border Radius"),
          ),
          backgroundColor: colorOptions(context, label: "Background Color"),
          labelText: "Label text here",
          prefixIcon: iconsOptions(
            context,
            label: "Widget Prefix",
            enabled: false,
          ),
          sufixIcon: iconsOptions(
            context,
            label: "Widget Sufix",
            enabled: false,
          ),
          // padding: EdgeInsets.symmetric(
          //   vertical: doubleSliderOptions(
          //     context,
          //     label: "Vertical Padding",
          //     initial: 8,
          //   ),
          //   horizontal: doubleSliderOptions(
          //     context,
          //     label: "Horizontal Padding",
          //     initial: 16,
          //   ),
          // ),
        ),
      ],
    ),
  ),
);
