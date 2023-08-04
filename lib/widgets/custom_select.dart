import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/utils/enums.dart';
import 'package:loomi_ui_flutter/utils/field_validator.dart';

class CustomSelect extends StatefulWidget {
  final dynamic value;
  final Function(dynamic value) onChanged;
  final List<DropdownMenuItem<dynamic>> list;
  final String? hintText;
  final TextStyle? textStyle;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final ValidatorResult? Function(dynamic)? validator;
  final TextStyle? labelStyle;
  final String? labelText;
  final TextStyle? errorStyle;
  final EdgeInsets padding;
  final BorderRadius? borderRadius;
  final Border? border;
  const CustomSelect({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.list,
    this.validator,
    this.prefixIcon,
    this.hintText,
    this.borderRadius,
    this.border,
    this.errorStyle,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.sufixIcon,
    this.textStyle,
    this.labelStyle,
    this.labelText,
  }) : super(key: key);

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  ValidatorResult? validatorResult;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 5),
            child: Text(
              widget.labelText!,
              style: widget.labelStyle,
            ),
          ),
        Container(
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            border: ValidatorResult.getBorder(
              context: context,
              changeBorderOnValidate: true,
              border: widget.border,
              validatorResult: validatorResult,
            ),
            color: widget.backgroundColor,
          ),
          child: Row(
            children: [
              if (widget.prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: widget.prefixIcon!,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<dynamic>(
                      style: widget.textStyle ??
                          Theme.of(context).textTheme.titleLarge,
                      validator: ((value) {
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
                      }),
                      value: widget.value,
                      icon: widget.sufixIcon,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorStyle: TextStyle(fontSize: 0, height: 0),
                      ),
                      hint: widget.hintText != null
                          ? Text(
                              widget.hintText!,
                              style: widget.textStyle ??
                                  Theme.of(context).textTheme.titleLarge,
                            )
                          : null,
                      onChanged: widget.onChanged,
                      items: widget.list,
                    ),
                  ),
                ),
              ),
            ],
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
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
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
