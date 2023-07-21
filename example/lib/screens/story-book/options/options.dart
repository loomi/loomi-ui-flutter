import 'package:flutter/material.dart';

import 'package:storybook_flutter/storybook_flutter.dart';

colorOptions(
  BuildContext context, {
  required String label,
  bool? enabled = true,
  Color? initial,
}) {
  return context.knobs.nullable.options<Color>(
    label: label,
    enabled: enabled!,
    initial: initial ?? Colors.blue,
    options: const [
      Option(
        label: 'Azul',
        value: Colors.blue,
      ),
      Option(
        label: 'Verde',
        value: Colors.green,
      ),
      Option(
        label: 'Vermelho',
        value: Colors.red,
      ),
      Option(
        label: 'Amarelo',
        value: Colors.yellow,
      ),
      Option(
        label: 'Branco',
        value: Colors.white,
      ),
      Option(
        label: 'Preto',
        value: Colors.black,
      ),
      Option(
        label: 'Cinza',
        value: Colors.grey,
      ),
    ],
  );
}

booleanOption(
  BuildContext context, {
  required String label,
  bool? enabled = true,
  String? description,
  bool? initial = false,
}) {
  return context.knobs.nullable.boolean(
        label: label,
        initial: initial ?? false,
        description: description,
        enabled: enabled!,
      ) ??
      initial;
}

doubleSliderOptions(
  BuildContext context, {
  required String label,
  bool? enabled = true,
  int? max = 100,
  int? min = 0,
  int? initial,
}) {
  return (context.knobs.nullable.sliderInt(
            label: label,
            initial: initial,
            max: max!,
            min: min!,
            enabled: enabled!,
          ) ??
          5)
      .toDouble();
}

intSliderOptions(
  BuildContext context, {
  required String label,
  bool? enabled = true,
  int? max = 100,
  int? min = 0,
  int? initial,
}) {
  return (context.knobs.nullable.sliderInt(
        label: label,
        initial: initial,
        max: max!,
        min: min!,
        enabled: enabled!,
      ) ??
      5);
}

iconsOptions(
  BuildContext context, {
  required String label,
  bool? enabled = true,
}) {
  return context.knobs.nullable.options(
    label: label,
    enabled: enabled!,
    initial: const Icon(Icons.arrow_forward_ios),
    options: const [
      Option(
        label: "Arrow Back",
        value: Icon(Icons.arrow_back_ios),
      ),
      Option(
        label: "Camera Alt",
        value: Icon(Icons.camera_alt),
      ),
      Option(
        label: "Notification Important",
        value: Icon(Icons.notification_important),
      ),
    ],
  );
}

borderOptions(
  BuildContext context, {
  required String label,
  bool? enabled = true,
}) {
  return context.knobs.nullable.options(
    label: label,
    initial: null,
    enabled: enabled!,
    options: [
      Option(
        label: 'Border',
        value: Border.all(
          color: Colors.white,
        ),
      ),
      const Option(
        label: 'No Border',
        value: null,
      ),
    ],
  );
}

inputBorderOptions(
  BuildContext context, {
  required String label,
  bool? enabled = true,
}) {
  return context.knobs.nullable.options(
    label: label,
    initial: null,
    enabled: enabled!,
    options: [
      const Option(
        label: 'Outline Input Border',
        value: OutlineInputBorder(),
      ),
      const Option(
        label: 'No Border',
        value: InputBorder.none,
      ),
    ],
  );
}

textAlignOptions(
  BuildContext context, {
  required String label,
  bool? enabled = true,
}) {
  return context.knobs.nullable.options(
    label: label,
    initial: TextAlign.start,
    enabled: enabled!,
    options: [
      const Option(
        label: 'Center',
        value: TextAlign.center,
      ),
      const Option(
        label: 'Start',
        value: TextAlign.start,
      ),
      const Option(
        label: 'End',
        value: TextAlign.center,
      ),
    ],
  );
}

alignOptions(
  BuildContext context, {
  required String label,
  bool? enabled = true,
}) {
  return context.knobs.nullable.options<Alignment>(
    label: label,
    initial: Alignment.bottomLeft,
    enabled: enabled!,
    options: [
      const Option(
        label: 'Center',
        value: Alignment.center,
      ),
      const Option(
        label: 'End',
        value: Alignment.bottomRight,
      ),
      const Option(
        label: 'Start',
        value: Alignment.bottomLeft,
      ),
    ],
  );
}
