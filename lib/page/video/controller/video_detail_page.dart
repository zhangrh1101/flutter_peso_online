import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';

class VideoDetailPage extends StatelessWidget {
  const VideoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    //9.重定义一个文字类型
    var textStyle = const TextStyle(
        color: Colors.blue, //文字颜色
        fontSize: 24, //文字大小
        fontWeight: FontWeight.normal,
        letterSpacing: 5);

    return Scaffold(
      appBar: AppBar(
        // 导航条
        title: const Text('视频详情'),
        titleTextStyle: const TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        foregroundColor: Colors.blue[900],
        backgroundColor: Colors.blue[300],
        shadowColor: Colors.red,
        elevation: 0.5,
      ),
      body: NotificationListener<TabbarNotification>(
        onNotification: (notification) {
          debugPrint('456');
          return true;
        },
        child: Container(
          // color: Colors.amber,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          // padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //元素与空白互相间隔
            children: [
              Text(
                'Hello Role SpreadPage',
                textDirection: TextDirection.ltr,
                style: textStyle,
              ),
              MaterialButton(
                height: 50,
                minWidth: 120,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                color: Colors.blue[100],
                child: const Text("跳转 push"),
                onPressed: () {
                  Get.toNamed(AppPages.TrendDetailPage);

                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (ctx) {
                  //   //不携带参数
                  //   return const TrendDetailPage(
                  //     title: '香叶123',
                  //   );
                  //   //携带参数(例如带一个字符串参数)
                  //   //return NewRoute("abc");
                  // }));
                },
              ),
              const SizedBox(height: 30),
              // const Spacer(),
              TextButton(
                style: const ButtonStyle(
                    // enableFeedback: false,
                    ),
                child: const Text("跳转 go 个人中心123"),
                onPressed: () {
                  // context.go('/ChatPage');
                  debugPrint('000');

                  TabbarNotification(0).dispatch(context);
                  debugPrint('123');
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const Text("跳转 replace"),
                onPressed: () {
                  Get.toNamed(AppPages.TrendDetailPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabbarNotification extends Notification {
  final int index;
  TabbarNotification(this.index);
}
