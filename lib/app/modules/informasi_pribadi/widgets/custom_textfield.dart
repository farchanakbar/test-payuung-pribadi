import 'package:flutter/material.dart';

import 'label_form.dart';

class CustomTextField extends StatelessWidget {
  final bool bintang;
  final String title;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.bintang,
    required this.title,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bintang(
          bintang: bintang,
          title: title,
        ),
        SizedBox(
          height: 50,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => controller.text = value,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
