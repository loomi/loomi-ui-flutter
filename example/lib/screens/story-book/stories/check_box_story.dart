import 'package:flutter/material.dart';

import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../options/options.dart';

Story checkBoxStory = Story(
  name: 'Custom CheckBox',
  description: 'A Custom CheckBox',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: CustomCheckBox(
      isChecked: booleanOption(
        context,
        label: "Is Checked",
      ),
      onChanged: (value) {},
      activeColor: colorOptions(
        context,
        label: "Active Color",
        initial: Colors.green,
      ),
      inactiveColor: colorOptions(
        context,
        label: "Inactive Color",
        initial: Colors.grey,
      ),
      size: doubleSliderOptions(
        context,
        label: "Size",
        initial: 30,
        min: 20,
        max: 100,
      ),
      borderRadius: doubleSliderOptions(
        context,
        label: "Border Radius",
        min: 8,
        max: 64,
        initial: 8,
      ),
      checkType: checkTypeOptions(
        context,
        label: "Check Type",
      ),
      labelText: 'Aceito os termos e condições',
      labelTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
      inactiveBorderColor: colorOptions(
        context,
        label: "inactiveBorderColor",
        initial: Colors.transparent,
      ),
      activeBorderColor: colorOptions(
        context,
        label: "activeBorderColor",
        initial: Colors.transparent,
      ),
    ),
  ),
);
