import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/controllers/informasi_pribadi_controller.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/widgets/custom_dropdown.dart';
import 'package:payung_teduh/app/modules/informasi_pribadi/widgets/custom_textfield.dart';

class InformasiPerusahaanView extends GetView<InformasiPribadiController> {
  const InformasiPerusahaanView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Form(
          child: Column(
            children: [
              CustomTextField(
                controller: controller.namaPerusahaan,
                bintang: false,
                title: 'nama usaha/perusahaan',
              ),
              CustomTextField(
                controller: controller.alamatPerusahaan,
                bintang: false,
                title: 'alamat usaha/perusahaan',
              ),
              CustomDropdown(
                items: const [],
                selectedValue: '',
                onChanged: null,
                title: 'Jabatan',
                bintang: false,
              ),
              CustomDropdown(
                items: const [],
                selectedValue: '',
                onChanged: null,
                title: 'Lama Bekerja',
                bintang: false,
              ),
              CustomDropdown(
                items: [],
                selectedValue: '',
                onChanged: null,
                title: 'Sumber Pendapatan',
                bintang: false,
              ),
              CustomDropdown(
                items: [],
                selectedValue: '',
                onChanged: null,
                title: 'pendapatan kotor pertahun',
                bintang: false,
              ),
              CustomDropdown(
                items: [],
                selectedValue: '',
                onChanged: null,
                title: 'Nama Bank',
                bintang: false,
              ),
              CustomTextField(
                  controller: controller.cabangBank,
                  bintang: false,
                  title: 'cabang bank'),
              CustomTextField(
                  controller: controller.noRekening,
                  bintang: false,
                  title: 'nomor rekening'),
              CustomTextField(
                  controller: controller.namaPemilikRekening,
                  bintang: false,
                  title: 'nama pemilik rekening'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                controller.currentIndex.value = 1;
                controller.pageController.jumpToPage(1);
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
                //
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
                    'Simpan',
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
