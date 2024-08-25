import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InformasiPribadiController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController alamatKtp = TextEditingController();
  TextEditingController kodePos = TextEditingController();
  TextEditingController namaPerusahaan = TextEditingController();
  TextEditingController alamatPerusahaan = TextEditingController();
  TextEditingController cabangBank = TextEditingController();
  TextEditingController noRekening = TextEditingController();
  TextEditingController namaPemilikRekening = TextEditingController();

  PageController pageController = PageController();

  final birthDate = DateTime.now().obs;

  RxBool centang = false.obs;
  RxBool isLoading = false.obs;
  RxBool isImageSuccess = false.obs;

  final RxString gender = 'Laki-Laki'.obs;
  final RxString namaFileImage = ''.obs;
  RxString? pendidikan;
  RxString? status;
  RxString? provinsi;
  RxString? kota;
  RxString? kecamatan;
  RxString? kelurahan;
  RxInt currentStep = 0.obs;
  RxInt currentIndex = 0.obs;

  void pickSource() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        height: Get.height * 0.16,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
                pickImage(ImageSource.gallery);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
                child: const Center(
                    child: Text(
                  'Galeri',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                pickImage(ImageSource.camera);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
                child: const Center(
                    child: Text(
                  'Kamera',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File?> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    isLoading.value = true;
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      isImageSuccess.value = true;
      isLoading.value = false;
      String namaFile = pickedFile.path;
      String last10Chars = namaFile.substring(namaFile.length - 10);
      namaFileImage.value = last10Chars;
      return File(pickedFile.path);
    } else {
      isLoading.value = false;
      return null;
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
