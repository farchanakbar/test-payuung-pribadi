import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/controllers/informasi_pribadi_controller.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/widgets/custom_dropdown.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/widgets/custom_textfield.dart';

class AlamatPribadiView extends GetView<InformasiPribadiController> {
  const AlamatPribadiView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.pickSource();
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: SvgPicture.asset(
                                      'assets/svg/id.svg',
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Upload KTP'),
                                      controller.isImageSuccess.value
                                          ? Text(controller.isImageSuccess.value
                                              ? 'ktp-${controller.namaFileImage.value}'
                                              : '')
                                          : SizedBox(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            controller.isImageSuccess.value
                                ? Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: controller.isLoading.value
                                          ? Colors.white
                                          : Colors.green[400],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: controller.isLoading.value
                                        ? CircularProgressIndicator()
                                        : Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                  )
                                : SizedBox()
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: controller.nik,
                      bintang: true,
                      title: 'nik',
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: controller.alamatKtp,
                bintang: true,
                title: 'alamat sesuai ktp',
              ),
              CustomDropdown(
                items: const [
                  'Jambi',
                  'Jakarta',
                  'Jawa Barat',
                ],
                selectedValue: controller.provinsi?.value,
                onChanged: (value) {
                  controller.provinsi?.value = value!;
                },
                title: 'Provinsi',
                bintang: true,
              ),
              CustomDropdown(
                  items: const [],
                  selectedValue: controller.kota?.value,
                  onChanged: null,
                  title: 'Kota/Kabupaten',
                  bintang: true),
              CustomDropdown(
                items: const [],
                selectedValue: controller.kecamatan?.value,
                onChanged: null,
                title: 'Kecamatan',
                bintang: true,
              ),
              CustomDropdown(
                items: const [],
                selectedValue: controller.kelurahan?.value,
                onChanged: null,
                title: 'Kelurahan',
                bintang: true,
              ),
              CustomTextField(
                controller: controller.kodePos,
                bintang: true,
                title: 'kode pos',
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.amber,
                  value: controller.centang.value,
                  onChanged: (value) {
                    controller.centang.value = value!;
                  },
                )),
            const Text('Sama dengan alamat KTP')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                controller.currentIndex.value = 0;
                controller.pageController.jumpToPage(0);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                height: 50,
                width: Get.width * 0.4,
                child: const Center(
                  child: Text(
                    'Sebelumnya',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.currentIndex.value = 2;
                controller.pageController.jumpToPage(2);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                height: 50,
                width: Get.width * 0.4,
                child: const Center(
                  child: Text(
                    'Selanjutnya',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
