import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class GetIcon extends StatelessWidget {
  final String icon;
  final double? width;
  final double? heigth;
  final Color? color;
  final bool isSvg;
  const GetIcon(
    this.icon, {
    super.key,
    this.heigth,
    this.width,
    this.color,
    this.isSvg = true,
  });

  @override
  Widget build(BuildContext context) {
    return isSvg
        ? SvgPicture.asset(
            icon,
            width: width,
            height: heigth,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(
                    color!,
                    BlendMode.color,
                  ),
          )
        : Image.asset(
            icon,
            width: width,
            height: heigth,
            color: color,
          );
  }
}
