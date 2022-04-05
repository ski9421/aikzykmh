import 'package:aikzykmh/page/video/widget/video_view.dart';
import 'package:aikzykmh/tool/screen.dart';
import 'package:flutter/material.dart';

// import 'package:aikzykmh/controller/video/video_controller.dart';
import 'package:get/get.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('视频'),
      ),
      body: Column(
        children: [
          _videoView(),
        ],
      ),
    );
  }

  _videoView() {
    var url =
        'https://txmov2.a.kwimgs.com/upic/2022/04/01/20/BMjAyMjA0MDEyMDIwNDhfMjAwNDEzOTc2M183MDk3NDU3Mzk3Ml8xXzM=_b_B61fd57e86899335d0b75704c4c92010f.mp4?clientCacheKey=3xm264x23ihtisa_b.mp4&tt=b&di=759f5f92&bp=13380';
    return VideoView(
      url: url,
      cover:
          'http://img.netbian.com/file/2022/0403/small003334oL8DI1648917214.jpg',
      autoPlay: false,
    );
  }
}
