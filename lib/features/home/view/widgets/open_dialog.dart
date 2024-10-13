import 'package:flutter/material.dart';
import 'package:med_reminder/core/theming/colors.dart';
import 'package:med_reminder/features/home/view/widgets/build_form_field.dart';

class OpenDialog extends StatelessWidget {
  OpenDialog({super.key});
  final _formKey = GlobalKey<FormState>();

  String? field1, field2, field3, field4, field5;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsManager.primary2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        'Enter Your Details',
        style: TextStyle(color: ColorsManager.primary),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextFormField('Field 1', (value) => field1 = value),
              buildTextFormField('Field 2', (value) => field2 = value),
              buildTextFormField('Field 3', (value) => field3 = value),
              buildTextFormField('Field 4', (value) => field4 = value),
              buildTextFormField('Field 5', (value) => field5 = value),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel', style: TextStyle(color: ColorsManager.primary)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.primary,
          ),
          child: const Text('Submit'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
