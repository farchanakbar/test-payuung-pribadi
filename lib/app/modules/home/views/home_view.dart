import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payung_teduh/app/data/data_item_wellness.dart';
import 'package:payung_teduh/app/data/data_kategori_keuangan.dart';
import 'package:payung_teduh/app/data/data_produk_keuangan.dart';
import 'package:payung_teduh/app/modules/home/views/kategori_keuangan.dart';
import 'package:payung_teduh/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'bottom_sheet.dart';
import 'produk_keuanga.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      bottomSheet: const BottomSheetView(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Pagi',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Farchan Akbar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //
                        },
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.INFORMASI_PRIBADI,
                          );
                        },
                        child: Image.asset(
                          'assets/icon/user.png',
                          height: 40,
                          width: 40,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey[200]),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.showDialog();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.amber),
                                  child: const Center(
                                      child: Text(
                                    'Payuung Pribadi',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.showDialog();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    // color: Colors.amber,
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Payuung Karyawan',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProdukKeuangan(
                        item: DataProdukKeuangan.gridProdukKeuangan,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Kategori Keuangan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.brown[200],
                            ),
                            child: Row(
                              children: [
                                const Text('Wishlist'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.amber,
                                  ),
                                  child: const Text('0'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProdukKategoriKeuangan(
                          item: DataKategoriKeuangan.gridKategoriKeuangan),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Explore Wellness',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            () => Row(
                              children: [
                                Container(
                                  height: 35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5), // Menambahkan padding
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: DropdownButton<String>(
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                    dropdownColor: Colors.grey[200],
                                    underline: const SizedBox(),
                                    value: controller.selectedFilter!.value,
                                    items: controller.filters.map((filter) {
                                      return DropdownMenuItem<String>(
                                        value: filter,
                                        child: Text(filter),
                                      );
                                    }).toList(),
                                    onChanged: (filter) {
                                      controller.selectedFilter!.value =
                                          filter!;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 200,
                          childAspectRatio: 4 / 3,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: DataWellness.items.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(DataWellness.items[index]['img']),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(DataWellness.items[index]['title']),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Rp ${DataWellness.items[index]['price']}')
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
