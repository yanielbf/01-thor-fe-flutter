import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/modules/main/main_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/utils/colors.dart';

class SliderMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return SideInAnimation(1,
          child: Container(
            width: Get.width,
            height: 230.0,
            child: Swiper(
              itemCount: _.banners.length,
              scrollDirection: Axis.horizontal,
              autoplay: true,
              autoplayDelay: 5000,
              control: new SwiperControl(),
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  activeColor: kPrimaryColor,
                  color: kYellowColor,
                ),
              ),
              itemBuilder: (context, index) {
                var banner = _.banners[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.PRODUCTDETAIL, arguments: banner.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30.0, right: 18.0, left: 18.0, top: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        imageUrl: banner.image,
                        width: Get.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                );
              },
            ),
          ));
    });
  }
}
