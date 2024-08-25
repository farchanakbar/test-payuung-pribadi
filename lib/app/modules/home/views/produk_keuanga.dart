import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data_produk_keuangan.dart';
import '../../../data/models/grid_item.dart';
import '../../../routes/app_pages.dart';
import '../widgets/grid_item_widgets.dart';

class ProdukKeuangan extends StatelessWidget {
  final List<GridItem> item;
  const ProdukKeuangan({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Produk Keuangan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          itemCount: DataProdukKeuangan.gridProdukKeuangan.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final item =
                DataProdukKeuangan.gridProdukKeuangan.map((e) => e).toList();
            return GridItemWidget(
              item: item[index],
              action: () {
                Get.toNamed(
                  Routes.DETAIL_PRODUK_KEUANGAN,
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
