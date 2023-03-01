import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loomi_ui_flutter/utils/enums.dart';
import 'package:loomi_ui_flutter/utils/field_validator.dart';

class LoomiTextFormField extends StatefulWidget {
  final String? label;
  final String? placeholderText;
  final String? hintText;
  final ValidatorResult? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final int? numberOfLines;
  final double? height;
  final String? initialValue;
  final Color? fillColor;
  final bool enabled;
  final bool readOnly;
  final bool filled;
  final bool autoFocus;
  final bool maxLines;
  final bool isPassword;
  final bool validateOnChange;
  final bool validateOnSubmit;
  final bool changeBorderOnValidate;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final InputBorder? inputDecorationBorder;
  final InputBorder? focusedInputDecorationBorder;
  final TextStyle? placeholderStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final TextStyle? labelStyle;
  final List<TextInputFormatter> inputFormatterList;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final BorderRadius? borderRadius;
  final Border? border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const LoomiTextFormField({
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLength,
    this.validator,
    this.initialValue,
    this.fillColor,
    this.errorStyle,
    this.focusNode,
    this.labelStyle,
    this.placeholderStyle,
    this.placeholderText,
    this.hintStyle,
    this.hintText,
    this.textStyle,
    this.borderRadius,
    this.height,
    this.numberOfLines = 1,
    this.filled = false,
    this.enabled = true,
    this.validateOnChange = false,
    this.validateOnSubmit = false,
    this.changeBorderOnValidate = true,
    this.maxLines = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.isPassword = false,
    this.textAlign = TextAlign.start,
    this.inputFormatterList = const [],
    this.keyboardType = TextInputType.text,
    this.inputDecorationBorder = InputBorder.none,
    this.focusedInputDecorationBorder = InputBorder.none,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    this.border,
    Key? key,
  }) : super(key: key);

  @override
  State<LoomiTextFormField> createState() => _LoomiTextFormFieldState();
}

class _LoomiTextFormFieldState extends State<LoomiTextFormField> {
  ValidatorResult? validatorResult;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null || widget.hintText != null)
          Padding(
            padding: widget.padding.copyWith(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label ?? "",
                  style: widget.labelStyle ??
                      Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: const Color(0xff000000),
                          ),
                ),
                Text(
                  widget.hintText ?? "",
                  style: widget.hintStyle ??
                      Theme.of(context).textTheme.caption!.copyWith(
                            color: const Color(0xff000000),
                          ),
                ),
              ],
            ),
          ),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ??
                const BorderRadius.all(
                  Radius.circular(4),
                ),
            border: ValidatorResult.getBorder(
              validatorResult: validatorResult,
              context: context,
              border: widget.border,
              changeBorderOnValidate: widget.changeBorderOnValidate,
            ),
            color: widget.filled ? widget.fillColor : const Color(0xffffffff),
          ),
          child: Localizations(
            locale: const Locale('en', 'US'),
            delegates: const <LocalizationsDelegate<dynamic>>[
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
            ],
            child: MediaQuery(
              data: const MediaQueryData(),
              child: Row(
                children: [
                  if (widget.prefixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10.71),
                      child: widget.prefixIcon,
                    ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextFormField(
                          scrollPadding: EdgeInsets.zero,
                          key: widget.key,
                          maxLength: widget.maxLength,
                          enabled: widget.enabled,
                          controller: widget.controller,
                          textInputAction: widget.numberOfLines == null ||
                                  widget.numberOfLines == 1
                              ? TextInputAction.next
                              : TextInputAction.newline,
                          validator: (value) {
                            if (widget.validator != null) {
                              setState(() {
                                validatorResult = widget.validator!(value);
                              });
                              if (validatorResult != null &&
                                  validatorResult!.validatorStatus !=
                                      ValidatorStatus.success) {
                                return "";
                              }
                            }
                            return null;
                          },
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          onChanged: (value) {
                            if (widget.onChanged != null) {
                              widget.onChanged!(value);
                            }
                            if (widget.validator != null &&
                                widget.validateOnChange) {
                              setState(() {
                                validatorResult = widget.validator!(value);
                              });
                            }
                          },
                          onFieldSubmitted: (value) {
                            if (widget.onFieldSubmitted != null) {
                              widget.onFieldSubmitted!(value);
                            }
                            if (widget.validator != null &&
                                widget.validateOnSubmit) {
                              setState(() {
                                validatorResult = widget.validator!(value);
                              });
                            }
                          },
                          keyboardType: widget.numberOfLines == null ||
                                  widget.numberOfLines == 1
                              ? widget.keyboardType
                              : TextInputType.multiline,
                          obscureText: widget.isPassword,
                          inputFormatters: widget.inputFormatterList,
                          textAlign: widget.textAlign,
                          maxLines:
                              widget.maxLines ? null : widget.numberOfLines,
                          initialValue: widget.initialValue,
                          focusNode: widget.focusNode,
                          autofocus: widget.autoFocus,
                          style: widget.textStyle ??
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xff212121),
                                  ),
                          decoration: InputDecoration(
                            hintText: widget.placeholderText,
                            errorStyle: const TextStyle(fontSize: 0, height: 0),
                            hintStyle: widget.placeholderStyle ??
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: const Color(0xff909090),
                                    ),
                            border: widget.inputDecorationBorder,
                            focusedBorder: widget.focusedInputDecorationBorder,
                            contentPadding: widget.padding,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.suffixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.71),
                      child: widget.suffixIcon!,
                    ),
                ],
              ),
            ),
          ),
        ),
        if (validatorResult != null)
          Padding(
            padding: widget.padding.copyWith(bottom: 0),
            child: Row(
              children: [
                if (validatorResult!.validatorStatus != null)
                  validatorResult!.getValidatorIcon(context) ??
                      const SizedBox.shrink(),
                if (validatorResult!.statusText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      validatorResult!.statusText!,
                      style: widget.errorStyle ??
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: const Color(0xff212121),
                              ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
