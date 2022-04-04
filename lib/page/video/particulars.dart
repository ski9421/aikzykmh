import 'package:aikzykmh/controller/video/video_controller.dart';
import 'package:aikzykmh/routes/routes.dart';
import 'package:aikzykmh/tool/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Particulars extends StatefulWidget {
  const Particulars({Key? key}) : super(key: key);

  @override
  State<Particulars> createState() => _ParticularsState();
}

class _ParticularsState extends State<Particulars> {
  final VideoController _videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('全部'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (c, i) {
          return Container(
            height: Screen.height(450),
            margin: EdgeInsets.all(Screen.height(30)),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _videoController.getVideoList(_videoController
                          .videoData[0][i]['videoId']
                          .toString());
                      Get.toNamed(Routes.VIDEOLIST);
                    },
                    child: Container(
                      height: Screen.height(450),
                      margin: EdgeInsets.only(right: Screen.height(30)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Screen.height(45)),
                        image: DecorationImage(
                            image: NetworkImage(
                                _videoController.videoData[0][i]['cover']),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print(_videoController.videoData[0][i]);
                    },
                    child: Container(
                      height: Screen.height(450),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Screen.height(45)),
                        // color: Colors.deepPurpleAccent,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: Screen.height(30), left: Screen.width(30)),
                            height: Screen.height(110),
                            width: double.infinity,
                            // color: Colors.white,
                            child: Text(
                              _videoController.videoData[0][i]['title'],
                              style: TextStyle(
                                  fontSize: Screen.size(55),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(Screen.height(30)),
                            height: Screen.height(340),
                            // color: Colors.white,
                            child: Text(
                              _videoController.videoData[0][i]['descs'],
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: Screen.size(45),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // child: Stack(
                      //   children: [
                      //     Positioned(
                      //       top: Screen.height(30),
                      //       left: Screen.height(30),
                      //       child: Text(
                      //         _videoController.videoData[0][i]['title'],
                      //         style: TextStyle(
                      //             fontSize: Screen.size(55),
                      //             fontWeight: FontWeight.w700),
                      //       ),
                      //     ),
                      //     Positioned(
                      //       top: Screen.height(100),
                      //       left: Screen.height(30),
                      //       child: SizedBox(
                      //         height: Screen.height(200),
                      //         child: Text(
                      //           _videoController.videoData[0][i]['descs'],
                      //           maxLines: 3,
                      //           // style: TextStyle(
                      //           //     fontSize: Screen.size(55),
                      //           //     fontWeight: FontWeight),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  flex: 4,
                ),
              ],
            ),

            // child: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(Screen.height(45)),
            //     color: Colors.deepPurpleAccent,
            //   ),
            //   margin: EdgeInsets.all(Screen.height(30)),
            //   height: Screen.height(450),
            //   child: Stack(
            //     children: [
            //       Container(
            //         width: Screen.width(350),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(Screen.height(45)),
            //               bottomLeft: Radius.circular(Screen.height(45)),
            //           ),
            //           image: DecorationImage(
            //             image: NetworkImage(_videoController.videoData[0][i]['cover']),fit: BoxFit.fill
            //           )
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          );
        },
        itemCount: _videoController.videoData[0].length,
      ),
    );
  }
}
