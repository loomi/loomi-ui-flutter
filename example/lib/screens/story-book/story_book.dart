import 'package:flutter/material.dart';

import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:example/screens/story-book/stories/check_box_story.dart';
import 'package:example/screens/story-book/stories/custom_alert_story.dart';
import 'package:example/screens/story-book/stories/custom_label_story.dart';
import 'package:example/screens/story-book/stories/custom_select_story.dart';
import 'package:example/screens/story-book/stories/custom_text_badge_story.dart';
import 'package:example/screens/story-book/stories/quantity_selector.dart';
import 'package:example/screens/story-book/stories/radio_selector_story.dart';
import 'package:example/screens/story-book/stories/show_dialog_story.dart';

import 'stories/custom_button_story.dart';
import 'stories/text_form_field_story.dart';

class StoryBook extends StatefulWidget {
  const StoryBook({super.key});

  @override
  State<StoryBook> createState() => _StoryBookState();
}

class _StoryBookState extends State<StoryBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Storybook(
        initialStory: "Custom Button",
        stories: [
          customButtonStory,
          textFormFieldStory,
          customLabelStory,
          showDialogStory,
          checkBoxStory,
          customSelectStory,
          radioSelectorStory,
          customTextBadgeStory,
          quantitySelectorStory,
          customAlertStory
        ],
      ),
    );
  }
}
