import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_ui_flutter/utils/custom_icons.dart';

class CustomAvatar extends StatefulWidget {
  final String avatarImage;
  final double width;
  final double height;
  final double borderRadius;
  final Color backGroundColor;
  final Color iconColor;

  const CustomAvatar({
    Key? key,
    required this.avatarImage,
    this.width = 50,
    this.height = 50,
    this.borderRadius = 100,
    this.backGroundColor = Colors.black,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: CachedNetworkImage(
        imageUrl: widget.avatarImage,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => _defaultAvatar(),
        progressIndicatorBuilder: (context, url, progress) => _defaultAvatar(),
      ),
    );
  }

  Widget _defaultAvatar() => Container(
        padding: const EdgeInsets.all(12),
        color: widget.backGroundColor,
        height: double.infinity,
        width: double.infinity,
        child: SvgPicture.asset(
          CustomIcons.userFilled,
          color: widget.iconColor,
        ),
      );
}
