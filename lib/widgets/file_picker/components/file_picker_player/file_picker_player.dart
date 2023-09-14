// import 'dart:io';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:loomi_ui_flutter/widgets/file_picker/components/file_picker_player/player_controls.dart';
// import 'package:video_player/video_player.dart';

// class FilePickerPlayer extends StatefulWidget {
//   const FilePickerPlayer({
//     Key? key,
//     required this.url,
//   }) : super(key: key);

//   final String url;

//   @override
//   State<FilePickerPlayer> createState() => _FilePickerPlayerState();
// }

// class _FilePickerPlayerState extends State<FilePickerPlayer> {
//   late FlickManager flickManager;

//   @override
//   void initState() {
//     flickManager = FlickManager(
//       videoPlayerController: (widget.url.contains("http")
//           ? VideoPlayerController.network(widget.url)
//           : VideoPlayerController.file(
//               File(widget.url),
//             ))
//         ..setLooping(true),
//       autoPlay: false,
//     );
//     flickManager.flickControlManager?.play();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     flickManager.flickControlManager?.pause();
//     flickManager.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlickVideoPlayer(
//       flickManager: flickManager,
//       flickVideoWithControls: FlickVideoWithControls(
//         playerLoadingFallback: Stack(
//           children: [
//             Positioned.fill(
//               child: Center(
//                 child: CircularProgressIndicator(
//                   backgroundColor: Theme.of(context).primaryColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         controls: FeedPlayerPortraitControls(
//           flickManager: flickManager,
//         ),
//       ),
//       flickVideoWithControlsFullscreen: FlickVideoWithControls(
//         controls: const FlickLandscapeControls(),
//         iconThemeData: IconThemeData(
//           size: 40,
//           color: Theme.of(context).primaryColor,
//         ),
//         textStyle: TextStyle(
//           fontSize: 16,
//           color: Theme.of(context).primaryColor,
//         ),
//       ),
//     );
//   }
// }
