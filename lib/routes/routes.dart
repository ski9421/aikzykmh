import 'package:get/get.dart';
import '../page/home_page.dart';
import '../page/video/particulars.dart';
import '../page/video/video_list.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.Initial,
      page: () => const HomePage(),
    ),
    GetPage(
        name: Routes.PARTICULARS,
        page: () => const Particulars(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.VIDEOLIST,
        page: () => const VideoList(),
        transition: Transition.downToUp),
    // GetPage(
    //   name: Routes.SEARCH,
    //   page: () => const SearchView(),
    //   transition: Transition.cupertino,
    // ),
    // GetPage(
    //   name: Routes.COMIC,
    //   page: () => const ComicView(),
    //   transition: Transition.downToUp,
    // ),
    // GetPage(
    //   name: Routes.CHAPTER,
    //   page: () => const ChapterView(),
    //   transition: Transition.cupertino,
    // )
  ];
}

abstract class Routes {
  static const Initial = '/';
  static const SEARCH = '/search';
  static const COMIC = '/comic';
  static const CHAPTER = '/chapter';
  static const PARTICULARS = '/particulars';
  static const VIDEOLIST = '/videoList';
}
