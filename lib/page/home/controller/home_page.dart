import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/api/api.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';
import 'package:flutter_peso_online/common/model/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  /// 类别列表
  List<String> categoryList = [];

  /// 轮播图列表
  List<BannerModel> bannerList = [];

  // @override
  // bool get wantKeepAlive => true; // 保持状态，那么为true

  @override
  void initState() {
    super.initState();

    loadData();
  }

  /// 加载数据
  loadData() {
    requestSwiper();
  }

  ///轮播图数据
  requestSwiper() async {
    print('获取轮播图数据 --- ');

    try {
      BaseModel model = await HomeApi.requestSwiper(
        params: {},
      );
      // debugPrint('获取轮播图数据 succese---> ${jsonEncode(model.data[0])}');

      var array = <BannerModel>[];
      for (var swiperJson in model.data) {
        BannerModel swiper = BannerModel.fromJson(swiperJson);
        // BannerModel swiper = BannerModel.fromJson(jsonDecode(swiperJson));
        print('获取轮播图数据 item---> ${swiper.title}');
        array.add(swiper);
      }

      setState(() {
        bannerList = array;
      });
      // ignore: unnecessary_type_check
      print('获取轮播图数据 swiperImgs---> ${bannerList}');
    } catch (e) {
      print('获取轮播图数据 error ---> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              CommonButton(
                width: MediaQuery.of(context).size.width,
                backgroundColor: AppColors.themeColor,
                borderRadius: 30,
                content: Text(
                  "下一步",
                  style: TextStyle(
                    color: HexColor('#333333'), //文字颜色
                    fontSize: kFontSize(15), //文字大小
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // onPressed:
                //     ValidatorUtil.isPhone(phone) ? () => _nextClick() : null,
                onPressed: () {
                  print('下一步');
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
