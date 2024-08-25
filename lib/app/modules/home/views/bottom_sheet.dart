import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payung_teduh/app/modules/home/controllers/home_controller.dart';

import '../../../data/data_menu.dart';
import '../widgets/grid_item_menu.dart';

class BottomSheetView extends GetView<HomeController> {
  const BottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: controller.menuShow.value ? Get.height * 0.45 : 95,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(255, 110, 104, 104),
          ),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.menuShowHandler();
                },
                child: Icon(
                  controller.menuShow.value
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  size: 30,
                ),
              ),
              GridView.builder(
                itemCount: DataMenu.menu.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final item = DataMenu.menu.map((e) => e).toList();
                  return GridItemMenu(
                    item: item[index],
                    index: index,
                    handler: () {
                      controller.menuActive(index);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
