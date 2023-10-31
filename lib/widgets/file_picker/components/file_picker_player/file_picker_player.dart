import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FilePickerPlayer extends StatefulWidget {
  const FilePickerPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  State<FilePickerPlayer> createState() => _FilePickerPlayerState();
}

class _FilePickerPlayerState extends State<FilePickerPlayer> {
  late VideoPlayerController _controller;
  bool shouldShowWidgets = true;
  late Timer widgetsTimer;
  @override
  void initState() {
    _controller = widget.url.contains("http")
        ? VideoPlayerController.contentUri(
            Uri.parse(widget.url),
          )
        : VideoPlayerController.file(
            File(widget.url),
          )
      ..initialize().then((value) {
        //_controller.play();
        _startTimer();
        setState(() {});
      });
    super.initState();
  }

  _startTimer() {
    widgetsTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (shouldShowWidgets) {
        toggleWidgets();
      }
    });
  }

  toggleWidgets() {
    setState(() {
      shouldShowWidgets = !shouldShowWidgets;
    });
  }

  @override
  void dispose() {
    _controller.pause();
    widgetsTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? Stack(
                children: [
                  VideoPlayer(_controller),
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: toggleWidgets,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: shouldShowWidgets
                            ? Colors.black.withOpacity(.5)
                            : Colors.transparent,
                        child: shouldShowWidgets
                            ? Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                  },
                                  child: Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 100,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ],
              )
            : Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
