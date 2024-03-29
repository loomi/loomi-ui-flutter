// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';

showLoomiToast({
  required BuildContext context,
  required String text,
  Widget? suffixIcon,
  Widget? prefixIcon,
  TextStyle? textStyle,
  Color? overlappingColor,
  double? overlappingColorOpacity,
  double? counterRadius,
  final bool? hasShadow = true,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) {
      return LoomiToastComponent(
        text: text,
        overlappingColor: overlappingColor,
        overlappingColorOpacity: overlappingColorOpacity,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        textStyle: textStyle,
        counterRadius: counterRadius,
        hasShadow: hasShadow,
      );
    },
  );
}

class LoomiToastComponent extends StatefulWidget {
  final String text;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final Color? overlappingColor;
  final double? overlappingColorOpacity;
  final double? counterRadius;
  final bool? hasShadow;

  const LoomiToastComponent({
    this.text = "",
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.overlappingColor,
    this.overlappingColorOpacity,
    this.counterRadius,
    this.hasShadow = true,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<LoomiToastComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 650,
      ),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticInOut,
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    timer = Timer(const Duration(seconds: 5), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
      padding: MediaQuery.of(context).viewInsets,
      alignment: Alignment.bottomCenter,
      child: Material(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            constraints: const BoxConstraints(minHeight: 60),
            decoration: BoxDecoration(
              color: (widget.overlappingColor ?? Theme.of(context).primaryColor)
                  .withOpacity(widget.overlappingColorOpacity ?? .11),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.counterRadius ?? 10)),
              boxShadow: widget.hasShadow == true
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.prefixIcon ?? Container(),
                      Expanded(
                        child: Text(
                          widget.text,
                          maxLines: 5,
                          style: widget.textStyle ??
                              TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                height: 1.2,
                              ),
                        ),
                      ),
                      widget.suffixIcon ?? Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
