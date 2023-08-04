import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loomi_ui_flutter/loomi_ui.dart';

class CustomAvatar extends StatefulWidget {
  final String avatarImage;
  final double width;
  final double height;
  final double borderRadius;
  final Color backGroundColor;
  final Color iconColor;
  final Color loaderColor;
  final bool isNetworkImage;
  final bool showLoader;

  const CustomAvatar({
    Key? key,
    required this.avatarImage,
    this.width = 50,
    this.height = 50,
    this.borderRadius = 100,
    this.backGroundColor = Colors.black,
    this.iconColor = Colors.white,
    this.isNetworkImage = true,
    this.showLoader = true,
    this.loaderColor = Colors.white,
  }) : super(key: key);

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: widget.isNetworkImage
          ? CachedNetworkImage(
              imageUrl: widget.avatarImage,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => _defaultAvatar(),
              progressIndicatorBuilder: (context, url, progress) =>
                  widget.showLoader ? _loader() : _defaultAvatar(),
            )
          : Image.asset(
              widget.avatarImage,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _defaultAvatar() => Container(
        padding: const EdgeInsets.all(12),
        color: widget.backGroundColor,
        height: double.infinity,
        width: double.infinity,
        child: GetIcon(
          CustomIcons.userFilled,
          color: widget.iconColor,
        ),
      );

  Widget _loader() => Container(
        width: double.infinity,
        height: double.infinity,
        color: widget.backGroundColor,
        child: Center(
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.loaderColor,
            ),
          ),
        ),
      );
}
