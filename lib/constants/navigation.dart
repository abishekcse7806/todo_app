import 'package:todo_app/view/completed_page/completed.dart';
import 'package:todo_app/view/pending_page/pending.dart';

const activePageID = Pending.pageID;
const completedPageID = Completed.pageID;

final routes = {
  activePageID: (context) => const Pending(),
  completedPageID: (context) => const Completed(),
};
