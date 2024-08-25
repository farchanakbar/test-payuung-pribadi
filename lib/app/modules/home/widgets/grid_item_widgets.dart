import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/grid_item.dart';

class GridItemWidget extends StatelessWidget {
  final GridItem item;
  final void Function() action;

  const GridItemWidget({
    super.key,
    required this.item,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            item.iconPath,
            height: 35,
            width: 35,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              item.label,
              style: const TextStyle(
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
