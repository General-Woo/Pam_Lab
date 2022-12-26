import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_4/pages/home/home_controller.dart';
import 'package:lab_4/pages/home/widgets/featured/featured.dart';
import 'package:lab_4/resources/custom_collors.dart';
import 'package:lab_4/resources/text_styles.dart';

import 'widgets/news/news_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<HomeController>()) {
      Get.lazyPut(() => HomeController());
    }
    HomeController controller = Get.find();
    controller.readJsonFile();
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Material(
      color: Colors.white,
      child: Obx(
        () => ListView.builder(
            itemCount: controller.news.value.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  children: [
                    Featured(),
                    Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Text("News",
                                style: TextStyles.textStyleSourceSansPro20(
                                    color: CustomColors.pickledBluewood,
                                    fontWeight: FontWeight.w600)),
                            Spacer(),
                            Text("See all",
                                style: TextStyles.textStyleSourceSansPro16(
                                    fontWeight: FontWeight.w600)),
                          ],
                        )),
                  ],
                );
              } else {
                // return NewsItem();
                return NewsItem(news_item: controller.news.value[index - 1]);
              }
            }),
      ),
    );
  }
}
