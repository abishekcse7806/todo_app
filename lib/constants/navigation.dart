import 'package:todo_app/view/pending_page/pending.dart';

import '../view/completed/completed.dart';

const activePageID = Pending.pageID;
const completedPageID = Completed.pageID;

final routes = {
  activePageID: (context) => const Pending(),
  completedPageID: (context) => const Completed(),
};
