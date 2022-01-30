import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/custom_widget/round_icon_button.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/view/widgets/add_alert.dart';
import 'package:todo_app/view/widgets/custom_list_tile.dart';

class Completed extends StatefulWidget {
  static const String pageID = 'completed';

  const Completed({Key? key}) : super(key: key);

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  List<Widget> completedWidgets = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    List<Todo> completed = await TodoService().getCompleted();
    completedWidgets.clear();

    if (completed.isNotEmpty) {
      for (var todo in completed) {
        completedWidgets
            .add(CustomListTile(currentTodo: todo, getData: getData));
      }
    } else {
      completedWidgets.add(
        const Center(
          child: Icon(
            Icons.hourglass_empty_rounded,
            color: kDoneColor,
            size: 130,
          ),
        ),
      );
    }

    setState(() {});
    TodoService().showCustomSnackBar(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(kTextCompleted),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: completedWidgets,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.clock,
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddAlert(refresh: () {}),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
