import 'package:flutter/material.dart';

void showLoomiDialog({
  required BuildContext context,
  required String title,
  required String body,
  String? confirmButtonText,
  String? firstActionTitle,
  String? secondActionTitle,
  Color? overlappingColor,
  Color? backgroundColor,
  Color? actionsColor,
  EdgeInsets? externalMargin,
  EdgeInsets? internalPadding,
  EdgeInsets? bodyPadding,
  EdgeInsets? actionsPadding,
  MainAxisAlignment? actionsAlignment,
  double? width,
  double? height,
  double? overlappingColorOpacity,
  double? counterRadius,
  Function()? firstActionTap,
  Function()? secondActionTap,
  Widget? icon,
  Widget? child,
  List<Widget>? actions,
}) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (context, animation1, animation2) {
        return StatefulBuilder(builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: externalMargin,
                width: width ?? 310,
                height: height,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Material(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(counterRadius ?? 28),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          (overlappingColor ?? Theme.of(context).primaryColor)
                              .withOpacity(overlappingColorOpacity ?? .11),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(28),
                      ),
                    ),
                    padding: internalPadding ?? const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: icon == null
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: icon != null,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: icon,
                          ),
                        ),
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: bodyPadding ??
                              const EdgeInsets.fromLTRB(0, 16, 0, 32),
                          child: Text(
                            body,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        if (child != null) child,
                        Padding(
                          padding: actionsPadding ??
                              const EdgeInsets.only(
                                top: 8,
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: actions ??
                                [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      secondActionTitle ?? 'Action 2',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: actionsColor ??
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      firstActionTitle ?? 'Action 1',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: actionsColor ??
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
      });
}
