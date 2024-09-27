import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/constants/packages.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: Navbar(title: '测试页面').build(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("重置主路由"),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              child: const Text("存储"),
              onPressed: () async {
                await StorageUtil.setString('aaaaa', '123456');
              },
            ),
            ElevatedButton(
              child: const Text("获取"),
              onPressed: () async {
                // ignore: await_only_futures
                var token = await StorageUtil.getString('aaaaa');
                debugPrint('Authorization ---> $token');
              },
            ),
            ElevatedButton(
              child: const Text("删除"),
              onPressed: () async {
                // ignore: await_only_futures
                await StorageUtil.remove('aaaaa');
              },
            ),
          ],
        ),
      ),
    );
  }
}
