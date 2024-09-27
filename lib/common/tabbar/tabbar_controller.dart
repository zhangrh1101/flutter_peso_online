import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import '../tools/event_bus.dart';

class TabbarController extends StatefulWidget {
  final int? currentIndex;
  final ValueChanged<int>? onChanged;

  const TabbarController(
      {super.key, this.currentIndex = 0, required this.onChanged});

  @override
  State<TabbarController> createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {
  List tabList = [
    {'title': '首页', 'icon': const Icon(Icons.home)},
    {'title': '订单', 'icon': const Icon(Icons.wechat)},
    {'title': '个人中心', 'icon': const Icon(Icons.person)},
  ];

  @override
  void initState() {
    super.initState();

    print('TabbarController ----');

    // eventBus.on<TabbarControllerEvent>().listen((event) {
    //   // All events are of type UserLoggedInEvent (or subtypes of it).print(event.user);
    //   debugPrint('TabbarControllerEvent ---000 $event');
    // });

    // 第三步监听操作
    eventBus.on<TabbarControllerEvent>().listen((event) {
      debugPrint('TabbarControllerEvent initState 监听--- ${event.index}');
      widget.onChanged!(event.index);
      // setState(() {
      //   currentIndex = event.index;
      // });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // eventBus.destroy();
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = widget.currentIndex!;
    debugPrint('currentIndex --- $currentIndex');

    // eventBus.on<TabbarControllerEvent>().listen((event) {
    //   debugPrint('TabbarControllerEvent111 监听--- ${event.index}');
    //   widget.onChanged!(event.index);
    //   // setState(() {
    //   //   currentIndex = event.index;
    //   // });
    // });

    //9.重定义一个文字类型
    var unselectedLabelStyle = TextStyle(
      color: HexColor('#999999'), //文字颜色
      fontSize: 12, //文字大小
      fontWeight: FontWeight.normal,
    );

    var selectedLabelStyle = TextStyle(
      color: HexColor('#ffe600'), //文字颜色
      fontSize: 12, //文字大小
      fontWeight: FontWeight.bold,
      // height: 2,
    );

//  const [
//         BottomNavigationBarItem(
//             icon: Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
//                 child: Icon(Icons.home)),
//             label: '首页'),
//         BottomNavigationBarItem(
//             icon: Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
//                 child: Icon(Icons.discord)),
//             label: '发现'),
//         BottomNavigationBarItem(
//             icon: Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
//                 child: Icon(Icons.share)),
//             label: '分享'),
//         BottomNavigationBarItem(
//             icon: Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
//                 child: Icon(Icons.person)),
//             label: '个人中心'),
//       ]

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,

      items: tabList.map((data) {
        String title = data["title"];
        Icon iconImg = data["icon"];

        /// 单个按钮条目
        return BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 3), child: iconImg),
            label: title);
      }).toList(),

      // 激活/未激活 颜色
      unselectedItemColor: Colors.blue,
      selectedItemColor: Colors.pink,

      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,

      useLegacyColorScheme: false,
      showSelectedLabels: true,
      showUnselectedLabels: true,

      //默认8.0
      // elevation: 20.0,
      currentIndex: currentIndex,
      //点击事件
      onTap: (index) {
        // onChanged(index);

        debugPrint('onTap --- $index');
        widget.onChanged!(index);

        // setState(() {
        //   currentIndex = index;
        // });
      },
    );
  }
}
