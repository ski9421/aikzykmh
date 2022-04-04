import 'package:aikzykmh/tool/screen.dart';
import 'package:flutter/material.dart';
// import 'package:aikzykmh/controller/video/video_controller.dart';
// import 'package:aikzykmh/tool/screen.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  late VideoPlayerController _controller;
  bool isOnTap = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        'https://v4.cdtlas.com/20211119/DH1B4QYT/index.m3u8')
      ..initialize().then((value) {
        // _controller.setLooping(false);
        // _controller.pause();
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: ListView(
        children: [
          Container(
            height: Screen.height(450),
            width: double.infinity,
            color: Colors.deepPurpleAccent,
            child: _controller.value.isInitialized == false
                ? const Center(
                    child: Text('加载中'),
                  )
                : Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isOnTap == false) {
                            isOnTap = true;
                          } else {
                            isOnTap = false;
                          }
                        },
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                      _controller.value.isPlaying == false
                          ? IconButton(
                              onPressed: () {
                                _controller.play();
                              },
                              icon: const Icon(Icons.play_arrow))
                          : Container(),
                      isOnTap == true
                          ? Center(
                              child: IconButton(
                                  onPressed: () {
                                    _controller.pause();
                                  },
                                  icon: const Icon(Icons.pause)),
                            )
                          : Container()
                    ],
                  ),
          ),
        ],
      ),
    );
    // return _controller.value.isInitialized == false
    //     ? const Center(
    //         child: Text('加载中'),
    //       )
    //     : const Center(
    //         child: Text('加载完成'),
    //       );
    // return Obx(()=>_controller.value.isInitialized == false ? const Center(
    //   child: Text('加载中'),):const Center(child: Text('加载完成'),));
    // return Container(
    //   child: TextButton(
    //       onPressed: () async {
    //         print(await _controller.value.isInitialized);
    //       },
    //       child: Text('按钮')),
    // );
  }
}
