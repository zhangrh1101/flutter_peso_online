import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// 缓存图片
class CacheImage extends StatelessWidget {
  final String imageUrl; //图片地址可能是网络也可能是本地
  final String? placeholder;
  final double? width; //图片的宽度
  final double? height; //图片的高度
  final double? radius; //图片圆角
  final EdgeInsetsGeometry? margin;
  final BoxFit? fit; //图片的缩放模式

  ///简单的列了几个使用到的,如果需要更多配置点进去源码都有写
  const CacheImage(
      {Key? key,
      required this.imageUrl,
      this.placeholder,
      this.width,
      this.height,
      this.radius = 0.0,
      this.margin,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///如果当前文件路径不存在/assets/image 的时候代表是网络图片 走CaChedNetWorkImage 如果不是那就走本地图片显示
    ///Constants.imageLocalPath 是自己定义的字符串常量 取决你把本地图片放在哪里了
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius!)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width ?? double.infinity,
        height: height,
        fit: fit ?? BoxFit.cover,

        // placeholder: (context, url) {
        //   return Container(
        //     alignment: Alignment.center,
        //     child: Image.asset(
        //       "images/login/login_swiper_intro_1.png",
        //       fit: BoxFit.cover,
        //     ),
        //   );
        // },
        // placeholder: (
        //   BuildContext context,
        //   String url,
        // ) =>
        //     Container(
        //   color: Colors.transparent,
        //   child: const Center(child: CircularProgressIndicator()),
        // ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
