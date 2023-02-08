import 'package:flutter/material.dart';
import 'package:simple_todo_list/models/todo.dart';
import 'package:simple_todo_list/widgets/floating_action_widget.dart';
import 'package:simple_todo_list/widgets/form_modal_dialog.dart';
import 'package:simple_todo_list/widgets/page_title_widget.dart';
import 'package:simple_todo_list/widgets/todo_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  List<Todo> todos = [];

  void add(Todo todo) {
    int id = 1;
    if (todos.isNotEmpty) {
      id = todos.last.id + 1;
    }
    todo.id = id;
    todos.add(todo);
    showScaffoldMessenger('Successfuly added');
    setState(() {});
  }

  void delete(int id) {
    todos.removeWhere((element) => element.id == id);
    showScaffoldMessenger('Successfuly deleted');
    setState(() {});
  }

  void edit(Todo todo) {
    for (var element in todos) {
      if (element.id == todo.id) {
        element.title = todo.title;
        element.desc = todo.desc;
        setState(() {});
        Navigator.of(context).pop();
        break;
      }
    }
    showScaffoldMessenger('Successfuly edited');
  }

  void showScaffoldMessenger(String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.amber,
        content: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonWidget(
        titleController: titleController,
        descController: descController,
        function: () {
          add(Todo(
            desc: descController.text,
            title: titleController.text,
          ));
          titleController.clear();
          descController.clear();
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const PageTitleWidget(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TodoCardWidget(
                      edit: () {
                        titleController.text = todos[index].title;
                        descController.text = todos[index].desc;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return FormBottomModal(
                              type: 'Edit',
                              titleController: titleController,
                              descController: descController,
                              funtion: () {
                                edit(
                                  Todo(
                                    id: todos[index].id,
                                    title: titleController.text,
                                    desc: descController.text,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      todo: todos[index],
                      delete: delete,
                    );
                  },
                  itemCount: todos.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
