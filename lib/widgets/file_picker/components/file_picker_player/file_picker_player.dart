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
        _controller.play();
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return FlickVideoPlayer(
    //   flickManager: flickManager,
    //   flickVideoWithControls: FlickVideoWithControls(
    //     playerLoadingFallback: Stack(
    //       children: [
    //         Positioned.fill(
    //           child: Center(
    //             child: CircularProgressIndicator(
    //               backgroundColor: Theme.of(context).primaryColor,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     controls: FeedPlayerPortraitControls(
    //       flickManager: flickManager,
    //     ),
    //   ),
    //   flickVideoWithControlsFullscreen: FlickVideoWithControls(
    //     controls: const FlickLandscapeControls(),
    //     iconThemeData: IconThemeData(
    //       size: 40,
    //       color: Theme.of(context).primaryColor,
    //     ),
    //     textStyle: TextStyle(
    //       fontSize: 16,
    //       color: Theme.of(context).primaryColor,
    //     ),
    //   ),
    // );
    return Stack(
      children: [
        _controller.value.isInitialized
            ? VideoPlayer(_controller)
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
