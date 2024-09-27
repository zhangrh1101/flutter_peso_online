import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';

class TrendDetailPage extends StatelessWidget {
  final String title;
  const TrendDetailPage({super.key, this.title = '动态详情'});

  @override
  Widget build(BuildContext context) {
    //9.重定义一个文字类型
    var textStyle = const TextStyle(
      color: Colors.blue, //文字颜色
      fontSize: 24, //文字大小
      fontWeight: FontWeight.normal,
      letterSpacing: 5,
    );

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: Navbar(title: title).build(context),
      body: SingleChildScrollView(
        // color: Colors.amber,
        // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //元素与空白互相间隔
          children: [
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外的body,,
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            Text(
              TextUtils.autoLines('Hello Role Trend DetailPage'),
              textDirection: TextDirection.ltr,
              style: textStyle,
            ), //导航条之外
            MaterialButton(
              height: 50,
              minWidth: 120,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.blue[100],
              child: const Text("跳转000"),
              onPressed: () {
                // context.pop('/RootPage');
                // context.push('/ChatPage');

                Get.toNamed(AppPages.OrderPage);

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
            // const SizedBox(height: 100),
            // const Spacer(),
            TextButton(
              style: const ButtonStyle(
                enableFeedback: false,
              ),
              child: const Text("跳转AAA"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text("重置主路由"),
              onPressed: () {
                // context.replace('/');
                Get.offAll(MainPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 防止文字自动换行
/// 当中英文混合，或者中文与数字或者特殊符号，或则英文单词时，文本会被自动换行，
/// 这样会导致，换行时上一行可能会留很大的空白区域
/// 把每个字符插入一个0宽的字符， \u{200B}
extension _FixAutoLines on String {
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }
}
