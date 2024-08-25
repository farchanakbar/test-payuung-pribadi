import 'package:flutter/material.dart';

import 'label_form.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String? title;
  final bool bintang;
  final ValueChanged<String?>? onChanged;
  final Widget? hint;
  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.title,
    required this.bintang,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bintang(title: title!, bintang: bintang),
        Container(
          color: onChanged == null ? Colors.brown[50] : Colors.white,
          height: 50,
          child: DropdownButtonFormField<String>(
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            isExpanded: true,
            hint: const Text('Pilih'),
            value: selectedValue,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
