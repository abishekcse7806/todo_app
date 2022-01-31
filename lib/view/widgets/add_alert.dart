import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/utilities.dart';
import 'package:todo_app/custom_widget/custom_formfield.dart';

import '../../service/todo_service.dart';

class AddAlert extends StatefulWidget {
  const AddAlert({Key? key, required this.refresh}) : super(key: key);

  final Function refresh;

  @override
  State<AddAlert> createState() => _AddAlertState();
}

class _AddAlertState extends State<AddAlert> {
  late DateTime dateTime = DateTime.now();

  final TextEditingController _dateControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    late String title;
    late String description;

    return AlertDialog(
      title: const Text('Add ToDo'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(label: Text('Title')),
              maxLength: 30,
              onSaved: (input) {
                title = input!;
              },
              validator: (input) {
                if (input != null && input.isNotEmpty) {
                  return null;
                }
                return '! Required';
              },
            ),
            CustomFormField(
              hintText: kTextTask,
              maxLength: 30,
              onSave: (input) {
                title = input!;
              },
              validation: ValidationType.emptiness,
            ),
            CustomFormField(
              hintText: kTextDescription,
              autoFocused: true,
              maxLines: 2,
              onSave: (input) {
                description = input!;
              },
              validation: ValidationType.emptiness,
            ),
            CustomFormField(
              hintText: kTextSelectDate,
              readOnly: true,
              validation: ValidationType.emptiness,
              onTapped: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050, 12),
                );

                if (pickedDate != null && pickedDate != dateTime) {
                  setState(() {
                    dateTime = pickedDate;
                    _dateControl.text = '${dateTime.toLocal()}'.split(' ')[0];
                  });
                }
              },
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  formKey.currentState!.reset();

                  bool added = await TodoService().add(
                      title: title,
                      description: description,
                      dateTime: dateTime);

                  TodoService().showCustomSnackBar(context);

                  if (added) {
                    widget.refresh();
                    Navigator.pop(context);
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(kTextCheckTheForm),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
