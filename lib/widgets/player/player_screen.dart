import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:video_player/video_player.dart';

import 'controls.dart';

pushToPlayerScreen({
  required BuildContext context,
  SubtitleController? subtitleController,
  Duration? seekOnInit,
  required String movieUrl,
  Function()? onBackground,
  required Color primaryColor,
  required Color secondaryColor,
  Function()? onExit,
  required Widget playerHeader,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PlayerScreen(
        seekOnInit: seekOnInit,
        header: playerHeader,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        subtitleController: subtitleController,
        movieUrl: movieUrl,
        onBackground: onBackground,
        onExit: onExit,
      ),
    ),
  );
}

class PlayerScreen extends StatefulWidget {
  final SubtitleController? subtitleController;
  final Duration? seekOnInit;
  final String movieUrl;
  final Function()? onBackground;
  final Function()? onExit;
  final Color primaryColor;
  final Color secondaryColor;
  final Widget header;
  const PlayerScreen({
    super.key,
    this.seekOnInit,
    required this.movieUrl,
    this.onBackground,
    required this.primaryColor,
    required this.secondaryColor,
    this.onExit,
    this.subtitleController,
    required this.header,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state != AppLifecycleState.resumed && widget.onBackground != null) {
      widget.onBackground!();
    }
  }

  late SubtitleController subtitleController;

  late FlickManager flickManager;
  @override
  void initState() {
    if (widget.subtitleController != null) {
      subtitleController = widget.subtitleController!;
    } else {
      subtitleController = SubtitleController(
        subtitleUrl: "https://pastebin.com/raw/Axt47CKa",
        subtitleDecoder: SubtitleDecoder.utf8,
        subtitleType: SubtitleType.webvtt,
      );
    }
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        widget.movieUrl,
      ),
    );
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      bool shouldSeek = true;
      flickManager.flickVideoManager!.videoPlayerController!
          .addListener(() async {
        if (flickManager
                .flickVideoManager!.videoPlayerController!.value.isPlaying &&
            widget.seekOnInit != null &&
            shouldSeek) {
          shouldSeek = false;
          flickManager.flickControlManager!.seekForward(
            widget.seekOnInit!,
          );
        }
      });
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    });

    super.initState();
  }

  @override
  void dispose() {
    flickManager.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          if (widget.onExit != null) {
            widget.onExit!();
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                FlickVideoPlayer(
                  flickManager: flickManager,
                  preferredDeviceOrientation: const [
                    DeviceOrientation.landscapeRight,
                    DeviceOrientation.landscapeLeft
                  ],
                  flickVideoWithControls: SubtitleWrapper(
                    subtitleController: subtitleController,
                    videoPlayerController:
                        flickManager.flickVideoManager!.videoPlayerController!,
                    subtitleStyle: SubtitleStyle(
                      textColor: widget.secondaryColor,
                      fontSize: 20,
                      hasBorder: true,
                      position: const SubtitlePosition(bottom: 40),
                    ),
                    videoChild: FlickVideoWithControls(
                      controls: CustomFlickPortraitControls(
                        header: widget.header,
                        flickManager: flickManager,
                        fontSize: 17,
                        progressBarSettings: FlickProgressBarSettings(
                          backgroundColor: widget.primaryColor,
                          playedColor: widget.secondaryColor,
                          handleColor: widget.secondaryColor,
                          height: 4,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
