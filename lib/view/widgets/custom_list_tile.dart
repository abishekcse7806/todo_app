import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/view/detail/detail.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key, required this.currentTodo, required this.getData})
      : super(key: key);

  final Todo currentTodo;
  final Function getData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 15.0, right: 12.0),
      child: ListTile(
        title: Text(currentTodo.title),
        subtitle: Text(currentTodo.description),
        trailing: Checkbox(
          value: currentTodo.time != null,
          onChanged: (bool? value) async {
            if (currentTodo.time == null) {
              bool toggled = await TodoService()
                  .update(id: currentTodo.id, completedTime: DateTime.now());
              if (toggled) {
                getData();
              }
            } else {
              bool toggled = await TodoService().update(
                id: currentTodo.id,
                completedTime: null,
              );
              if (toggled) {
                getData();
              }
            }
          },
        ),
        tileColor: kTileColor,
        onTap: () async {
          bool refresh = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detail(thisTodo: currentTodo)));
          refresh ? getData() : {};
        },
      ),
    );
  }
}
