import 'package:flutter/material.dart';

class Bintang extends StatelessWidget {
  final String title;
  final bool bintang;
  const Bintang({super.key, required this.title, required this.bintang});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            bintang
                ? const Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                : const SizedBox(),
            bintang
                ? const SizedBox(
                    width: 5,
                  )
                : const SizedBox(),
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
