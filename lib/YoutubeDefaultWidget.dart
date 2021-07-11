import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class YoutubeDefaultWidget extends StatefulWidget {
  final String videoId;

  const YoutubeDefaultWidget({Key key, this.videoId}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<YoutubeDefaultWidget>
    implements YouTubePlayerListener {
  double _currentVideoSecond = 0.0;
  String _playerState = "";
  FlutterYoutubeViewController _controller;
  Timer timer;

  @override
  void onCurrentSecond(double second) {
    print("onCurrentSecond second = $second");
    _currentVideoSecond = second;
  }

  @override
  void onError(String error) {
    print("onError error = $error");
  }

  @override
  void onReady() {
    print("onReady");
  }

  @override
  void onStateChange(String state) {
    print("onStateChange state = $state");
    setState(() {
      _playerState = state;
    });
  }

  @override
  void onVideoDuration(double duration) {
    print("onVideoDuration duration = $duration");
  }

  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
    this._controller = controller;
    Timer(Duration(seconds: 4), () {
      _loadOrCueVideo();
    });
  }

  void _loadOrCueVideo() {
    _controller.loadOrCueVideo(widget.videoId, _currentVideoSecond);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Default UI')),
        body: Stack(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
            margin: EdgeInsets.only(top: 22),
            child: FlutterYoutubeView(
              onViewCreated: _onYoutubeCreated,
              listener: this,
              params: YoutubeParam(
                videoId: widget.videoId,
                showUI: true,
                startSeconds: 5 * 60.0,
                showYoutube: false,
                showFullScreen: false,
              ),
            )),
        // Center(
        //     child: Column(
        //   children: <Widget>[
        //     Text(
        //       'Current state: $_playerState',
        //       style: TextStyle(color: Colors.blue),
        //     ),
        //     RaisedButton(
        //       onPressed: _loadOrCueVideo,
        //       child: Text('Click reload video'),
        //     ),
        //   ],
        // ))
      ],
    ));
  }
}
