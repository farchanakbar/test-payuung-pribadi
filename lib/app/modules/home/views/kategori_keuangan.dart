import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payung_teduh/app/data/data_kategori_keuangan.dart';

import '../../../data/models/grid_item.dart';
import '../../../routes/app_pages.dart';
import '../widgets/grid_item_widgets.dart';

class ProdukKategoriKeuangan extends StatelessWidget {
  final List<GridItem> item;
  const ProdukKategoriKeuangan({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          itemCount: DataKategoriKeuangan.gridKategoriKeuangan.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final item = DataKategoriKeuangan.gridKategoriKeuangan
                .map((e) => e)
                .toList();
            return GridItemWidget(
              item: item[index],
              action: () {
                Get.toNamed(
                  Routes.DETAIL_KATEGORI_KEUANGAN,
                  arguments: item[index],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
