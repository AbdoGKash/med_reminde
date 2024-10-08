import 'package:flutter/material.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/core/theming/text_styel.dart';
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
      body: Center(
        child: Text(
          'Press the button to open the form',
          style: TextStyle(fontSize: 20, color: Colors.blueAccent[700]),
        ),
      ),
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
