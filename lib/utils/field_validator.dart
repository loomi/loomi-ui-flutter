import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/utils/enums.dart';

class ValidatorResult {
  String? statusText;
  ValidatorStatus? validatorStatus;
  ValidatorResult({this.statusText, this.validatorStatus});
  Widget? getValidatorIcon(BuildContext context) {
    if (validatorStatus == null) return null;
    switch (validatorStatus) {
      case ValidatorStatus.error:
        return CircleAvatar(
          radius: 3,
          backgroundColor: getValidatorColor(context),
        );
      case ValidatorStatus.warning:
        return CircleAvatar(
          radius: 3,
          backgroundColor: getValidatorColor(context),
        );
      case ValidatorStatus.success:
        return CircleAvatar(
          radius: 3,
          backgroundColor: getValidatorColor(context),
        );
      default:
        return null;
    }
  }

  Color? getValidatorColor(BuildContext context) {
    if (validatorStatus == null) return null;
    switch (validatorStatus) {
      case ValidatorStatus.error:
        return Theme.of(context).colorScheme.error;
      case ValidatorStatus.warning:
        return Colors.yellow;
      case ValidatorStatus.success:
        return Colors.green;
      default:
        return null;
    }
  }

  static Border getBorder({
    ValidatorResult? validatorResult,
    required BuildContext context,
    Border? border,
    required bool changeBorderOnValidate,
  }) {
    bool hasValidatoResult = validatorResult != null;
    Border defaultBorder = border ??
        Border.all(
          width: 1,
          color: const Color(0xffe9e9e9),
        );
    if (!changeBorderOnValidate || !hasValidatoResult) {
      return defaultBorder;
    }

    Color defaultBorderColor =
        border != null ? border.top.color : const Color(0xffe9e9e9);

    Color? validatorColor = validatorResult.getValidatorColor(context);
    bool hasValidatorColor = validatorColor != null;

    BorderSide paintedBorderSide = defaultBorder.top.copyWith(
      color: hasValidatorColor ? validatorColor : defaultBorderColor,
    );

    defaultBorder = Border.fromBorderSide(paintedBorderSide);
    return defaultBorder;
  }
}
