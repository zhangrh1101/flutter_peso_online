import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:flutter_peso_online/common/utils/utils.dart';
import 'package:flutter_peso_online/common/widgets/widgets.dart';

class SwiperView extends StatelessWidget {
  //高度
  final double? height;

  //宽度
  final double? width;

  //圆角
  final double? radius; //图片圆角

  ///图片地址
  final List<String> images;

  ///点击事件
  final ValueChanged<int>? onTap;

  const SwiperView({
    super.key,
    this.height = 300,
    this.width,
    required this.images,
    this.radius = 0.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Swiper(
        autoplay: true,
        autoplayDelay: 3000,
        // duration: 2500,
        scale: 0.7,
        //轮播图之间的间距
        // viewportFraction: 1.0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => onTap!(index),
              child: ValidatorUtil.isHttpUrl(images[index])
                  ? CacheImage(
                      width: width,
                      imageUrl: images[index],
                      radius: radius,
                    )
                  : Image.asset(
                      width: width,
                      // height: kPixel(220),
                      images[index],
                      fit: BoxFit.fill,
                    ),
            ),
          );
        },
        itemCount: images.length,
        pagination: SwiperPagination(
          // 此处使用自己编写的样式
          builder: CustomSwiperPaginationBuilder(
              activeColor: HexColor('#CCCCCC'), alignment: Alignment.center),
        ),
      ),
      // control: const SwiperControl(),
    );
  }
}
