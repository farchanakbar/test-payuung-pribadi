import 'package:get/get.dart';

import '../controllers/detail_kategori_keuangan_controller.dart';

class DetailKategoriKeuanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKategoriKeuanganController>(
      () => DetailKategoriKeuanganController(),
    );
  }
}
