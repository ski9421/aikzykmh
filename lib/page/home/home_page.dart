import 'package:aikzykmh/controller/home/home_controller.dart';
import 'package:aikzykmh/tool/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+Screen.height(30)),
              height: Screen.height(550),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: Screen.height(450),
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % 18],
                      borderRadius: BorderRadius.circular(Screen.height(30)),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://pic.netbian.com/uploads/allimg/220215/233510-16449393101c46.jpg'),
                          fit: BoxFit.fill),
                    ),
                  );
                },
                onTap: (index) {
                  print(_homeController.swiper);
                },
                itemCount: 5,
                autoplay: true,
                // pagination: const SwiperPagination(),
                // control: const SwiperControl(),
                //缩放
                viewportFraction: 0.8,
                scale: 0.8, //间距
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     margin: EdgeInsets.only(top:Screen.height(30),bottom: Screen.height(30),left: Screen.height(100),right: Screen.height(100)),
          //     height: Screen.height(100),
          //     padding: EdgeInsets.only(left: Screen.height(30),right: Screen.height(30)),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text('漫画搜索',style: TextStyle(fontSize: Screen.size(50),fontWeight: FontWeight.w700,color: Colors.deepPurpleAccent),),
          //         Image.asset('assets/icon/home/sousuo.png',width: Screen.width(70),)
          //         // Icon(Image(image: AssetImage('assets/icon/home/fenlei.png'),))
          //       ],
          //     ),
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         width: 2,
          //         color: Colors.deepPurpleAccent
          //       ),
          //       // color: Colors.black,
          //       borderRadius: BorderRadius.circular(Screen.height(50))
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(Screen.height(30)),
              height: Screen.height(150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Screen.height(30)),
                color: Colors.deepPurpleAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icon/home/guanjun.png',
                          width: Screen.width(100),
                        ),
                        Text(
                          '排行',
                          style: TextStyle(fontSize: Screen.size(50)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon/home/huodong.png',
                          width: Screen.width(100),
                        ),
                        Text(
                          '活动',
                          style: TextStyle(fontSize: Screen.size(50)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon/home/hongbao.png',
                          width: Screen.width(100),
                        ),
                        Text(
                          '福利',
                          style: TextStyle(fontSize: Screen.size(50)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon/home/youhuiquan.png',
                          width: Screen.width(100),
                        ),
                        Text(
                          '优惠',
                          style: TextStyle(fontSize: Screen.size(50)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.only(
                      left: Screen.width(30), right: Screen.width(30)),
                  height: Screen.height(80),
                  child: Text(
                    '新漫上架～客官看这里',
                    style: TextStyle(fontSize: Screen.size(50)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: Screen.height(30),
                      left: Screen.height(30),
                      right: Screen.height(30)),
                  height: Screen.height(260),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Screen.height(30)),
                      color: Colors.deepPurpleAccent,
                      image: const DecorationImage(
                          image: AssetImage('assets/image/tm.png'),
                          fit: BoxFit.fill)),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: Screen.height(30),
                        left: Screen.height(30),
                        right: Screen.height(30)),
                    height: Screen.height(980),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.7),
                          itemCount: 6,
                          itemBuilder: (c, i) {
                            return Container(
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                'https://manhua.acimg.cn/vertical/0/21_14_19_152a687976add4668a09152838acc690_1532153983992.jpg/0'),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(Screen.height(20)),
                                      ),
                                    ),
                                    flex: 6,
                                  ),
                                  const Expanded(
                                    child: Text('漫画名'),
                                    flex: 1,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Screen.height(20)),
                                // color: Colors.deepPurpleAccent,
                              ),
                            );
                          }),
                    )),
                Container(
                  height: Screen.height(100),
                  margin: EdgeInsets.all(Screen.height(30)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Screen.height(50)),
                    color: Colors.deepPurpleAccent,
                  ),
                  child: const Center(
                    child: Text('更多新品漫画点击查看'),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.only(
                      left: Screen.width(30), right: Screen.width(30)),
                  height: Screen.height(60),
                  child: Text(
                    '新漫上架～客官看这里',
                    style: TextStyle(fontSize: Screen.size(50)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: Screen.height(30),
                      left: Screen.height(30),
                      right: Screen.height(30)),
                  height: Screen.height(260),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Screen.height(30)),
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(Screen.height(30)),
                    height: Screen.height(810),
                    child: MediaQuery.removePadding(
                      context: context, removeTop: true,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.8),
                          itemCount: 6,
                          itemBuilder: (c, i) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Screen.height(20)),
                                color: Colors.deepPurpleAccent,
                              ),
                            );
                          }),
                      // height: Screen.height(600),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
