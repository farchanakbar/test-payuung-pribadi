import 'package:get/get.dart';

import '../modules/detail_kategori_keuangan/bindings/detail_kategori_keuangan_binding.dart';
import '../modules/detail_kategori_keuangan/views/detail_kategori_keuangan_view.dart';
import '../modules/detail_produk_keuangan/bindings/detail_produk_keuangan_binding.dart';
import '../modules/detail_produk_keuangan/views/detail_produk_keuangan_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/informasi_pribadi/bindings/informasi_pribadi_binding.dart';
import '../modules/informasi_pribadi/views/informasi_pribadi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI_PRIBADI,
      page: () => const InformasiPribadiView(),
      binding: InformasiPribadiBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUK_KEUANGAN,
      page: () => const DetailProdukKeuanganView(),
      binding: DetailProdukKeuanganBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.DETAIL_KATEGORI_KEUANGAN,
      page: () => const DetailKategoriKeuanganView(),
      binding: DetailKategoriKeuanganBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
