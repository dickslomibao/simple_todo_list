import 'package:flutter/material.dart';
import 'package:simple_todo_list/widgets/add_button_widget.dart';
import 'package:simple_todo_list/widgets/text_field_widget.dart';

class FormBottomModal extends StatelessWidget {
 const FormBottomModal({
    super.key,
    required this.titleController,
    required this.descController,
    required this.funtion,
    required this.type,
  });
  final TextEditingController titleController;
  final TextEditingController descController;
  final Function funtion;
  final String type;
  @override
  Widget build(BuildContext context) {
    if (type == 'Create') {
      titleController.text = "";
      descController.text = "";
    }
    return AlertDialog(
      title: Text("$type Todo-List"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWidget(
              label: "Title",
              controller: titleController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              label: "Description",
              controller: descController,
            ),
            const SizedBox(
              height: 25,
            ),
            AddButtonWidget(
                function: funtion, label: type == "Create" ? "Add" : "Save"),
          ],
        ),
      ),
    );
  }
}
