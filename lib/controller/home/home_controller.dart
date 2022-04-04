import 'package:aikzykmh/tool/dio.dart';
import 'package:aikzykmh/tool/getmd5.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLanding = false.obs;
  var swiper = [].obs;

  //getHot数据
  var getNewestData = [].obs;
  var getHotData = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // get();
    getSwiper();
    getNewest();
    getHot();
    isLoadingData();
  }

  void isLoadingData() async {
    if (swiper.isEmpty == false &&
        getNewestData.isEmpty == false &&
        getHotData.isEmpty == false) {
      isLanding.value = true;
    }
  }

  Future<void> getSwiper() async {
    var token = await getToken(DateTime.now());
    var timeDate = await getTime(DateTime.now());
    var result = await DioTool.getInstance()!.dio.post(
        '/app.php/tag/getBanners',
        queryParameters: {'num': 5, 'token': token, 'time': timeDate});
    if (result.data['success'] == 1) {
      swiper.add(result.data['banners']);
    } else {
      getSwiper();
    }
  }

  Future<void> getNewest() async {
    var token = await getToken(DateTime.now());
    var timeDate = await getTime(DateTime.now());
    var result = await DioTool.getInstance()!.dio.post(
        '/app.php/books/getNewest',
        queryParameters: {'num': 20, 'token': token, 'time': timeDate});
    if (result.data['success'] == 1) {
      print('新漫'+result.data.toString());
      getNewestData.add(result.data['newest']);
    } else {
      getNewest();
    }
  }

  Future<void> getHot() async {
    var token = await getToken(DateTime.now());
    var timeDate = await getTime(DateTime.now());
    var result = await DioTool.getInstance()!.dio.post('/app.php/books/getHot',
        queryParameters: {'num': 20, 'token': token, 'time': timeDate});
    if (result.data['success'] == 1) {
      print('热门'+result.data.toString());
      getHotData.add(result.data['newest']);
    } else {
      print('热门'+result.data.toString());
      getHot();
    }
  }
}
