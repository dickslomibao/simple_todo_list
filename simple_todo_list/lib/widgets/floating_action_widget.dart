import 'package:flutter/material.dart';
import 'package:simple_todo_list/widgets/form_modal_dialog.dart';

class FloatingActionButtonWidget extends StatelessWidget {
 const FloatingActionButtonWidget(
      {Key? key,
      required this.function,
      required this.titleController,
      required this.descController})
      : super(key: key);
  final TextEditingController titleController;
  final TextEditingController descController;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.amber,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return FormBottomModal(
              type: 'Create',
              titleController: titleController,
              descController: descController,
              funtion: function,
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
