import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/core/theming/text_styel.dart';
import 'package:med_reminder/features/home/view/widgets/medicine_card.dart';
import 'package:med_reminder/features/home/view/widgets/open_dialog.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyles.font24WhiteBold,
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.primary,
      ),
      body: Padding(
          padding: const EdgeInsets.all(6.0).dg,
          child: const SingleChildScrollView(
            child: Column(
              children: [
                MedicineCard(),
                MedicineCard(),
                MedicineCard(),
                MedicineCard()
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.primary,
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return OpenDialog();
            }),
      ),
    );
  }
}
