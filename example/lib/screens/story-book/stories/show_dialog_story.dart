import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

Story showDialogStory = Story(
  name: 'Custom Dialog And Custom Toast',
  description: 'A Custom Dialog and A Custom Toast',
  builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          text: "Show Toast",
          onTap: () {
            showLoomiToast(
              context: context,
              text: 'Conteúdo do Toast aqui',
              counterRadius: 30,
              overlappingColor: Colors.red,
              hasShadow: false,
              textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
            );
          },
        ),
        const SizedBox(
          width: 30,
        ),
        CustomButton(
          text: "Open Custom Dialog",
          onTap: () {
            showLoomiDialog(
              context: context,
              title: "Título do dialog",
              body: "Conteúdo do body",
              firstActionTitle: "Primeira ação",
              secondActionTitle: "Segunda ação",
              confirmButtonText: "Botão de confirmação",
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: Text("Possible Child Widget Here")),
                ],
              ),
              // actions: ,
              // actionsAlignment: ,
              // backgroundColor: colorOptions(context, label: "Background Color"),
              // overlappingColorOpacity: doubleSliderOptions(
              //   context,
              //   label: "Overlapping Color Opacity",
              //   initial: 1,
              // ),
              // overlappingColor: colorOptions(context, label: "Overlapping Color"),
              // actionsColor: colorOptions(context, label: "Actions Color"),
              // icon: iconsOptions(
              //   context,
              //   label: "Icon",
              //   enabled: false,
              // ),
              // bodyPadding: EdgeInsets.symmetric(
              //   vertical: doubleSliderOptions(
              //     context,
              //     label: "Body Vertical Padding",
              //     initial: 8,
              //   ),
              //   horizontal: doubleSliderOptions(
              //     context,
              //     label: "Body Horizontal Padding",
              //     initial: 16,
              //   ),
              // ),
              // internalPadding: EdgeInsets.symmetric(
              //   vertical: doubleSliderOptions(
              //     context,
              //     label: "Internal Vertical Padding",
              //     initial: 8,
              //   ),
              //   horizontal: doubleSliderOptions(
              //     context,
              //     label: "Internal Horizontal Padding",
              //     initial: 16,
              //   ),
              // ),
              // actionsPadding: EdgeInsets.symmetric(
              //   vertical: doubleSliderOptions(
              //     context,
              //     label: "Actions Vertical Padding",
              //     initial: 8,
              //   ),
              //   horizontal: doubleSliderOptions(
              //     context,
              //     label: "Actions Horizontal Padding",
              //     initial: 16,
              //   ),
              // ),
              // externalMargin: EdgeInsets.symmetric(
              //   vertical: doubleSliderOptions(
              //     context,
              //     label: "External Vertical Margin",
              //     initial: 8,
              //   ),
              //   horizontal: doubleSliderOptions(
              //     context,
              //     label: "External Horizontal Margin",
              //     initial: 16,
              //   ),
              // ),

              // width: doubleSliderOptions(
              //   context,
              //   label: "Width",
              //   initial: 300,
              //   max: 600,
              //   min: 40,
              // ),
              // height: doubleSliderOptions(
              //   context,
              //   label: "Height",
              //   initial: 300,
              //   max: 300,
              //   min: 40,
              // ),
              // radius: doubleSliderOptions(
              //   context,
              //   label: "Border Radius",
              //   initial: 0,
              //   max: 100,
              //   min: 0,
              // ),
            );
          },
        ),
      ],
    ),
  ),
);
