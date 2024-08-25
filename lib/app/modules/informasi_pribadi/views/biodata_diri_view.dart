import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:payung_teduh/app/data/data_dropdown.dart';

import '../controllers/informasi_pribadi_controller.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/label_form.dart';

class BiodataDiriView extends GetView<InformasiPribadiController> {
  const BiodataDiriView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  bintang: true,
                  title: 'nama lengkap',
                  controller: controller.name,
                ),
                const Bintang(
                  title: 'tanggal lahir',
                  bintang: true,
                ),
                SizedBox(
                  height: 50,
                  child: Obx(() => TextField(
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsetsDirectional.symmetric(horizontal: 10),
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        controller: TextEditingController(
                          text: DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(controller.birthDate.value),
                        ),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: controller.birthDate.value,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            controller.birthDate.value = date;
                          }
                        },
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Bintang(
                  title: 'jenis kelamin',
                  bintang: true,
                ),
                SizedBox(
                  height: 50,
                  child: DropdownButtonFormField<String>(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                    value: controller.gender.value,
                    items: DataDropdown.jenisKelamin
                        .map((gender) => DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    controller: controller.email,
                    bintang: true,
                    title: 'alamat email'),
                CustomTextField(
                    controller: controller.noHp,
                    bintang: true,
                    title: 'no. hp'),
                CustomDropdown(
                  items: DataDropdown.pendidikan,
                  selectedValue: controller.pendidikan?.value,
                  onChanged: (value) {
                    controller.pendidikan?.value = value!;
                  },
                  bintang: false,
                  title: 'Pendidikan',
                ),
                CustomDropdown(
                  items: DataDropdown.status,
                  selectedValue: controller.status?.value,
                  onChanged: (value) {
                    controller.status?.value = value!;
                  },
                  title: 'Status Pernikahan',
                  bintang: false,
                ),
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 1;
                    controller.pageController.jumpToPage(1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    height: 50,
                    width: Get.width,
                    child: const Center(
                      child: Text(
                        'Selanjutnya',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
