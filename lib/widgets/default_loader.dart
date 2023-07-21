import 'package:flutter/material.dart';

class DefaultLoader extends StatefulWidget {
  final Color? color;
  const DefaultLoader({super.key, this.color});

  @override
  State<DefaultLoader> createState() => _DefaultLoaderState();
}

class _DefaultLoaderState extends State<DefaultLoader> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.color ?? Colors.white,
        ),
      ),
    );
  }
}
