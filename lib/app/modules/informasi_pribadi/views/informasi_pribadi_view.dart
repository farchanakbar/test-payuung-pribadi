import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/views/alamat_pribadi_view.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/views/biodata_diri_view.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/views/informasi_perusahaan_view.dart';
import '../controllers/informasi_pribadi_controller.dart';

class InformasiPribadiView extends GetView<InformasiPribadiController> {
  const InformasiPribadiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: const Text(
          'Informasi Pribadi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepperComponent(
                    currentIndex: controller.currentIndex.value,
                    index: 0,
                    onTap: () {
                      controller.currentIndex.value = 0;
                      controller.pageController.jumpToPage(0);
                    },
                  ),
                  StepperComponent(
                    currentIndex: controller.currentIndex.value,
                    index: 1,
                    onTap: () {
                      controller.currentIndex.value = 1;
                      controller.pageController.jumpToPage(1);
                    },
                  ),
                  StepperComponent(
                    currentIndex: controller.currentIndex.value,
                    index: 2,
                    isLast: true,
                    onTap: () {
                      controller.currentIndex.value = 2;
                      controller.pageController.jumpToPage(2);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView.builder(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return BiodataDiriView();
                    } else if (index == 1) {
                      return AlamatPribadiView();
                    } else {
                      return InformasiPerusahaanView();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  final int index;
  final int currentIndex;
  final VoidCallback onTap;
  final bool isLast;

  const StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    //now let's remove the ligne at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget
    if (index == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //this is the bubble
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: index == currentIndex
                        ? Colors.orange
                        : Colors.transparent,
                    border: Border.all(
                        color: currentIndex >= index
                            ? Colors.orange
                            : Colors.black12),
                  ),
                  child: Center(child: Text('${index + 1}')),
                ),
              ),
              //this the ligne
              Container(
                height: 2,
                color:
                    currentIndex >= index + 1 ? Colors.orange : Colors.black12,
              )
            ],
          ),
          //index+1 we dont wanna show 0 in the screen since our index will start at 0
          const Text(
            'Biodata Diri',
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (index == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //this is the bubble
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: index == currentIndex
                        ? Colors.orange
                        : Colors.transparent,
                    border: Border.all(
                        color: currentIndex >= index
                            ? Colors.orange
                            : Colors.black12),
                  ),
                  child: Center(child: Text('${index + 1}')),
                ),
              ),
              Container(
                height: 2,
                color:
                    currentIndex >= index + 1 ? Colors.orange : Colors.black12,
              )
            ],
          ),
          //index+1 we dont wanna show 0 in the screen since our index will start at 0
          const Text(
            'Alamat\nPribadi',
            textAlign: TextAlign.start,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //this is the bubble
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: index == currentIndex
                        ? Colors.orange
                        : Colors.transparent,
                    border: Border.all(
                        color: currentIndex >= index
                            ? Colors.orange
                            : Colors.black12),
                  ),
                  child: Center(child: Text('${index + 1}')),
                ),
              ),
            ],
          ),
          //index+1 we dont wanna show 0 in the screen since our index will start at 0
          const Text(
            'Informasi\nPerusahaan',
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }
}
