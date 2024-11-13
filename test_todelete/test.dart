import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

void main() {
  runApp(RTSPExampleApp());
}

class RTSPExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RTSP Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RTSPHomePage(),
    );
  }
}

class RTSPHomePage extends StatefulWidget {
  @override
  _RTSPHomePageState createState() => _RTSPHomePageState();
}

class _RTSPHomePageState extends State<RTSPHomePage> {
  late VlcPlayerController _vlcViewController;

  @override
  void initState() {
    super.initState();

    // Replace with your RTSP URL
    String rtspUrl = 'rtsp://192.168.1.31/live/stream_1';

    _vlcViewController = VlcPlayerController.network(
      rtspUrl,
      hwAcc: HwAcc.full, // Enable hardware acceleration
      autoPlay: true, // Automatically play the stream
    );
  }

  @override
  void dispose() {
    _vlcViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RTSP Stream Test'),
      ),
      body: Center(
        child: VlcPlayer(
          controller: _vlcViewController,
          aspectRatio: 16 / 9, // Adjust aspect ratio based on your stream
          placeholder: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
