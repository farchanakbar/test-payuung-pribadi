import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payung_teduh/app/modules/home/controllers/home_controller.dart';

import '../../../data/models/grid_item.dart';

class GridItemMenu extends GetView<HomeController> {
  final GridItem item;
  final int index;
  final void Function() handler;

  const GridItemMenu({
    super.key,
    required this.item,
    required this.handler,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: handler,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: controller.selectedIndex.value == index
                      ? Colors.amber
                      : Colors.grey[20],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  item.iconPath,
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 11,
                    color: controller.selectedIndex.value == index
                        ? Colors.amber
                        : Colors.grey[20],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
