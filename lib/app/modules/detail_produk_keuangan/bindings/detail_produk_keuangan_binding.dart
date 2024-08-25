import 'package:get/get.dart';

import '../controllers/detail_produk_keuangan_controller.dart';

class DetailProdukKeuanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProdukKeuanganController>(
      () => DetailProdukKeuanganController(),
    );
  }
}
