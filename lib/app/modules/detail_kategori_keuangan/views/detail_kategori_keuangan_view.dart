import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/grid_item.dart';
import '../controllers/detail_kategori_keuangan_controller.dart';

class DetailKategoriKeuanganView
    extends GetView<DetailKategoriKeuanganController> {
  const DetailKategoriKeuanganView({super.key});
  @override
  Widget build(BuildContext context) {
    GridItem data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(data.label),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          data.label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
