import 'package:aikzykmh/controller/video/video_controller.dart';
import 'package:aikzykmh/routes/routes.dart';
import 'package:aikzykmh/tool/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoHomePage extends StatefulWidget {
  const VideoHomePage({Key? key}) : super(key: key);

  @override
  State<VideoHomePage> createState() => _VideoHomePageState();
}

class _VideoHomePageState extends State<VideoHomePage> {
  final TextEditingController _controller = TextEditingController();
  final VideoController _videoController = Get.put(VideoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('视频'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: Screen.height(150),
          margin: EdgeInsets.all(Screen.height(30)),
          // child: Image.asset('assets/image/loading.gif'),
          child: TextField(
            controller: _controller,
            textInputAction: TextInputAction.search,
            onSubmitted: (v) async {
              _videoController.getSearch(_controller.text);
              showAlertDialog(context);
              Future.delayed(const Duration(seconds: 3), () {
                if (_videoController.isLoading.value == true) {
                  Get.back();
                  Get.toNamed(Routes.PARTICULARS);
                }
              });

              // print(_controller.text);
              // while(true){
              //   _videoController.isLoading.value == false
              //       ? showAlertDialog(context)
              //       : null;
              // }
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: '请输入影片名字',
              // hintStyle: TextStyle(fontSize: Screen.size()),
              suffixIcon: Container(
                child: Image.asset('assets/icon/home/sousuo.png'),
                width: Screen.width(35),
                margin: EdgeInsets.only(right: Screen.width(15)),
              ),
              border: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius:
                    BorderRadius.all(Radius.circular(Screen.height(30))),

                ///用来配置边框的样式
                borderSide: const BorderSide(
                  ///设置边框的颜色
                  color: Colors.grey,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius:
                    BorderRadius.all(Radius.circular(Screen.height(30))),

                ///用来配置边框的样式
                borderSide: const BorderSide(
                  ///设置边框的颜色
                  color: Colors.grey,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius:
                    BorderRadius.all(Radius.circular(Screen.height(30))),

                ///用来配置边框的样式
                borderSide: const BorderSide(
                  ///设置边框的颜色
                  color: Colors.grey,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),

              ///用来配置输入框获取焦点时的颜色
              focusedBorder: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius:
                    BorderRadius.all(Radius.circular(Screen.height(30))),

                ///用来配置边框的样式
                borderSide: const BorderSide(
                  ///设置边框的颜色
                  color: Colors.grey,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              color: Colors.transparent,
              child: Image.asset('assets/image/loading.gif'),
            ),
          );
        });
  }
}
