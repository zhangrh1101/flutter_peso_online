import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import '../home/controller/home_page.dart';
import '../order/controller/order_page.dart';
import '../mine/controller/mine_page.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _RootPageState();
}

class _RootPageState extends State<MainPage> {
  String _tabbarImage = 'tabbar_01';
  final List<Widget> _pages = [
    const HomePage(),
    const OrderPage(),
    const MinePage(),
  ];

  //6.设置当前BarItems的默认选中Item, 当某一个被选中的时候,这个index值会发生变化.
  int _currentIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    debugPrint('App启动 initState ---');

    // 检查app更新
    checkAppUpdate();

    _pageController = PageController(initialPage: _currentIndex);
  }

  void checkAppUpdate() {
    debugPrint('App启动 检查app更新 ---');
  }

  onChanged(index) {
    // 更新状态
    setState(() {
      debugPrint('RootPage onChanged --- $index');

      _tabbarImage = 'tabbar_0${index + 1}';
      _currentIndex = index;
      _pageController.jumpToPage(index);

      debugPrint('RootPage onChanged 111--- $_pageController');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _pages[_currentIndex],
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages, // 禁止滑动
          ),
          Positioned(
            bottom: ScreenUtil().bottomBarHeight,
            right: kPixel(-64),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(right: kPixel(90), bottom: kPixel(4)),
                  child: Image(
                    width: kPixel(270),
                    height: kPixel(120),
                    image: AssetImage('images/tabbar/$_tabbarImage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kPixel(100)),
                  child: Image(
                    width: kPixel(200),
                    height: kPixel(300),
                    image: const AssetImage('images/tabbar/tabbar_man.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: kPixel(90),
                  width: kPixel(260),
                  height: kPixel(40),
                  child: MaterialButton(
                    onPressed: () {
                      onChanged(2);
                    },
                  ),
                ),
                Positioned(
                  bottom: kPixel(44),
                  right: kPixel(90),
                  width: kPixel(270),
                  height: kPixel(40),
                  child: MaterialButton(
                    onPressed: () {
                      onChanged(1);
                    },
                  ),
                ),
                Positioned(
                  bottom: kPixel(84),
                  right: kPixel(90),
                  width: kPixel(260),
                  height: kPixel(40),
                  child: MaterialButton(
                    onPressed: () {
                      onChanged(0);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
