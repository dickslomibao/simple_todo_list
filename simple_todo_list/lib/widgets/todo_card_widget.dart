import 'package:flutter/material.dart';
import 'package:simple_todo_list/models/todo.dart';

class TodoCardWidget extends StatelessWidget {
  const TodoCardWidget({
    super.key,
    required this.todo,
    required this.delete,
    required this.edit,
  });

  final Todo todo;
  final Function delete;
  final Function edit;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
        ),
      ),
      key: ValueKey(todo.id),
      onDismissed: (direction) {
        delete(todo.id);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text(todo.id.toString()),
          ),
          trailing: IconButton(
            onPressed: () {
              edit();
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.greenAccent,
            ),
          ),
          title: Text(todo.title),
          subtitle: Text(todo.desc),
        ),
      ),
    );
  }
}
