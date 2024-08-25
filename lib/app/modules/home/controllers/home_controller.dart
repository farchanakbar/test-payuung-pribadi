import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payung_teduh/app/data/data_item_wellness.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString? selectedFilter = 'Terpopuler'.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool menuShow = false.obs;
  RxInt selectedIndex = 0.obs;

  void menuShowHandler() {
    menuShow.value = !menuShow.value;
  }

  void showDialog() {
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Masukkan email dan password Payuung Karyawan',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 50,
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                //
              },
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
                child: const Center(
                  child: Text(
                    'Sambungkan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Kembali'))
          ],
        ),
      ),
    );
  }

  void menuActive(int index) {
    selectedIndex.value = index;
  }

  final List<String> filters = [
    'Terpopuler',
    'A to Z',
    'Z to A',
    'Harga Terendah',
    'Harga Tertinggi'
  ];

  @override
  void onInit() {
    super.onInit();
    loadItemsFromStorage();
  }

  Future<void> loadItemsFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 6; i++) {
      DataWellness.items[i]['img'] =
          prefs.getString('img$i') ?? DataWellness.items[i]['img'];
      DataWellness.items[i]['title'] =
          prefs.getString('title$i') ?? DataWellness.items[i]['title'];
      DataWellness.items[i]['price'] =
          prefs.getString('price$i') ?? DataWellness.items[i]['price'];
    }
  }

  Future<void> saveItemsToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 6; i++) {
      await prefs.setString('title$i', DataWellness.items[i]['img']);
      await prefs.setString('subtitle$i', DataWellness.items[i]['title']);
      await prefs.setString('price$i', DataWellness.items[i]['price']);
    }
    print('sukses');
  }
}
