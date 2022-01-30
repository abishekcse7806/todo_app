import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/navigation.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/custom_widget/round_icon_button.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/view/widgets/add_alert.dart';
import 'package:todo_app/view/widgets/custom_list_tile.dart';

class Pending extends StatefulWidget {
  static const pageID = 'active';

  const Pending({Key? key}) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  List<Widget> pendingWidgets = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    print('Getting data');

    List<Todo> pending = await TodoService().getPending();
    pendingWidgets.clear();

    if (pending.isNotEmpty) {
      for (var todo in pending) {
        pendingWidgets.add(CustomListTile(
          currentTodo: todo,
          getData: getData,
        ));
      }
    } else {
      pendingWidgets.add(
        const Center(
          child: Icon(
            Icons.check_circle_outline_rounded,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(kTextTodo),
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
                  children: pendingWidgets,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.check,
                  onPressed: () async {
                    bool reload =
                        await Navigator.pushNamed(context, completedPageID)
                            as bool;
                    reload ? getData() : {};
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
                      builder: (context) => AddAlert(refresh: getData),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
