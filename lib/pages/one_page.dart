import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import '../constant/text_size_constant.dart';
import '../constant/color_constant.dart';

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
      _videoPlayerController2 = VideoPlayerController.asset('images/bing.mp4');
      _chewieController = ChewieController( 
      videoPlayerController: _videoPlayerController2,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: false,
      allowFullScreen: true,
      //isLive: true,
      // Try playing around with some of these other options:

      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.green,
        handleColor: Colors.blue,
        backgroundColor: Colors.white,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        //width: 50.0,
        //color: Colors.white,
      ),
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('CAM_1',
            style: TextStyle(
              color: ColorConstant.colorDefaultTitle,
              fontWeight: FontWeight.w600,
              fontSize: TextSizeConstant.TextImageSize,
            )
          ),
        ),
        Chewie(
          controller: _chewieController,
        )
      ]
    );
  }
}
