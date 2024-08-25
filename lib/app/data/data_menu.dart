import 'models/grid_item.dart';

class DataMenu {
  static final List<GridItem> menu = [
    GridItem(
      iconPath: 'assets/svg/menu-2.svg',
      label: 'Beranda',
    ),
    GridItem(
      iconPath: 'assets/svg/search.svg',
      label: 'Cari',
    ),
    GridItem(
      iconPath: 'assets/svg/cart.svg',
      label: 'Keranjang',
    ),
    GridItem(
      iconPath: 'assets/svg/box.svg',
      label: 'Daftar Transaksi',
    ),
    GridItem(
      iconPath: 'assets/svg/voucher.svg',
      label: 'Voucher Saya',
    ),
    GridItem(
      iconPath: 'assets/svg/location.svg',
      label: 'Alamat Pengiriman',
    ),
    GridItem(
      iconPath: 'assets/svg/person.svg',
      label: 'Daftar Teman',
    ),
  ];
}
