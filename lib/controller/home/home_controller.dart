import 'package:aikzykmh/tool/dio.dart';
import 'package:aikzykmh/tool/getmd5.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLanding = false.obs;
  var swiper = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // get();
    getSwiper();
  }

  void get() {
    for (int i = 0; i < 3; i++) {
      if (isLanding.value == true) {
        break;
      } else {
        getSwiper();
      }
    }
  }

  Future<void> getSwiper() async {
    var token = await getToken(DateTime.now());
    var timeDate = await getTime(DateTime.now());
    var result = await DioTool.getInstance()!.dio.post(
        '/app.php/tag/getBanners',
        queryParameters: {'num': 5, 'token': token, 'time': timeDate});
    if (result.data['success'] == 1) {
      swiper.add(result.data);
    } else {
      getSwiper();
    }
  }
}
