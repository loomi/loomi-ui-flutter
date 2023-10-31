import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loomi_ui_flutter/loomi_ui.dart';
import 'package:video_player/video_player.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:wakelock/wakelock.dart';

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
    this.subtitleController,
    this.seekOnInit,
    required this.movieUrl,
    this.onBackground,
    this.onExit,
    required this.primaryColor,
    required this.secondaryColor,
    required this.header,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  late Timer widgetsTimer;
  bool shouldShowWidgets = false;
  late SubtitleController subtitleController;
  late Timer playTimer;
  Duration _position = const Duration();
  @override
  void initState() {
    Wakelock.enable();
    WidgetsBinding.instance.addObserver(this);
    if (widget.subtitleController != null) {
      subtitleController = widget.subtitleController!;
    } else {
      subtitleController = SubtitleController(
        subtitleUrl: "https://pastebin.com/raw/Axt47CKa",
        subtitleDecoder: SubtitleDecoder.utf8,
        subtitleType: SubtitleType.webvtt,
      );
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    widgetsTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (shouldShowWidgets) {
        toggleWidgets();
      }
    });
    bool shouldSeek = true;
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.movieUrl,
      ),
    )
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
        _startTimer();
      }, onError: (e) {
        log("$e");
      })
      ..addListener(() {
        if (_controller.value.isPlaying &&
            widget.seekOnInit != null &&
            shouldSeek) {
          shouldSeek = false;
          _controller.seekTo(
            widget.seekOnInit!,
          );
        }
      });

    super.initState();
  }

  _startTimer() {
    playTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _controller.position.then((position) {
        setState(() {
          _position = position ?? const Duration();
        });
      });
    });
  }

  toggleWidgets() {
    setState(() {
      shouldShowWidgets = !shouldShowWidgets;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state != AppLifecycleState.resumed && widget.onBackground != null) {
      widget.onBackground!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final duration = _controller.value.duration;
    final remaining = duration - _position;
    return WillPopScope(
      onWillPop: () async {
        if (widget.onExit != null) {
          widget.onExit!();
        }
        return true;
      },
      child: Scaffold(
        body: _controller.value.isInitialized
            ? Stack(
                children: [
                  SubtitleWrapper(
                    subtitleController: subtitleController,
                    videoPlayerController: _controller,
                    subtitleStyle: const SubtitleStyle(
                      textColor: Colors.yellow,
                      fontSize: 20,
                      hasBorder: true,
                      position: SubtitlePosition(bottom: 40),
                    ),
                    videoChild: VideoPlayer(_controller),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        toggleWidgets();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: shouldShowWidgets
                            ? Colors.black.withOpacity(.5)
                            : Colors.transparent,
                        child: shouldShowWidgets
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.header,
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _controller.seekTo(
                                            Duration(
                                                seconds:
                                                    _position.inSeconds - 15),
                                          );
                                        },
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Center(
                                            child: GetIcon(
                                              CustomIcons.seekBackward,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
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
                                      GestureDetector(
                                        onTap: () {
                                          _controller.seekTo(
                                            Duration(
                                                seconds:
                                                    _position.inSeconds + 15),
                                          );
                                        },
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Center(
                                            child: GetIcon(
                                              CustomIcons.seekFoward,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _controller.value.isPlaying
                                                ? _controller.pause()
                                                : _controller.play();
                                          });
                                        },
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Center(
                                            child: Icon(
                                              _controller.value.isPlaying
                                                  ? Icons.pause_rounded
                                                  : Icons.play_arrow_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: VideoProgressIndicator(
                                          _controller,
                                          colors: VideoProgressColors(
                                            playedColor: widget.primaryColor,
                                            bufferedColor:
                                                widget.secondaryColor,
                                            backgroundColor:
                                                Colors.grey.withOpacity(
                                              .5,
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          allowScrubbing: true,
                                        ),
                                      ),
                                      Text(
                                        '${remaining.inMinutes}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                      const SizedBox(width: 15),
                                    ],
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    playTimer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    widgetsTimer.cancel();
    Wakelock.disable();
    _controller.dispose();
  }
}
