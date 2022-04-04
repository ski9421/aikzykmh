import 'package:aikzykmh/tool/dio.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  var videoList = [].obs;
  var videoData = [].obs;
  var isLoading = false.obs;

  Future<void> getSearch(key) async {
    isLoading.value = false;
    var result = await DioTool.getInstance()!
        .dio
        .get('https://api.pingcc.cn/video/search/title/$key/1/30');
    if (result.data['code'] == 0) {
      if (videoData.isEmpty) {
        videoData.add(result.data['data']);
      } else {
        videoData[0] = result.data['data'];
      }
      isLoading.value = true;
    }
  }

  Future<void> getVideoList(videoId) async {
    var result = await DioTool.getInstance()!
        .dio
        .get('https://api.pingcc.cn/videoChapter/search/'+videoId);
    print(result.data);
    if (result.data['code'] == 0) {
      if (videoList.isEmpty) {
        videoList.add(result.data['data']);
      } else {
        videoList[0] = result.data['data'];
      }
    }
  }
}
