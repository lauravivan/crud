import 'mainClasses/Task.dart';
import 'mainClasses/Action.dart';
import 'mainClasses/ImportantDate.dart';
import 'mainClasses/Mood.dart';
import 'utilClasses/Time.dart';
import 'util/util.dart';
import 'util/crud.dart';
import 'util/output.dart';

final class App {
  String _id = '';
  List<Task> _tasks = [];
  List<ImportantDate> _important_dates = [];
  List<Action> _recurring_actions = [];
  Mood _mood = new Mood(generateUniqueId(), '');
  List<Mood> _moodsHistory = [];

  App(String id) {
    _id = id;
  }

  List<Task> get tasks => _tasks;

  List<ImportantDate> get important_dates => _important_dates;

  List<Action> get recurring_actions => _recurring_actions;

  List<Mood> get moodsHistory => _moodsHistory;

  set addToMoodsHistory(Mood mood) {
    /**
    * A função verifica se a lista já possui algum humor
    * Se possuir ela verifica se a mesma data já foi adicionada
    * Só adiciona se for em uma data diferente
    */
    List<Mood> list = moodsHistory;

    if (list.length > 0) {
      bool inMoodHistory = false;

      for (var m in list) {
        if (m.date == mood.date) {
          inMoodHistory = true;
        }
      }

      if (!inMoodHistory) {
        _moodsHistory.add(mood);
      }
    } else {
      _moodsHistory.add(mood);
    }
  }

  Mood get mood => _mood;
  set mood(Mood mood) => _mood = mood;

  void showMoodsHistory() {
    printList(list: moodsHistory, title: "MOOD'S HISTORY");
  }

  void createTask(
      {String task_name = '',
      String starts_at = '',
      String ends_at = '',
      String task_status = ''}) {
    Task task = Task(generateUniqueId(), task_name);

    task.setStatus(task_status);
    task.starts_at = Time(starts_at);
    task.ends_at = Time(ends_at);
    task.starts_at.isAM = starts_at.contains('a');
    task.ends_at.isAM = ends_at.contains('a');

    _tasks.add(task);

    printCrudOperationReturn(getAppOperations()[0], 'create');
  }

  void readTasks() {
    printList(
        list: tasks, app_operation: getAppOperations()[0], title: 'TASKS');
  }

  void deleteTask(int list_position) {
    deleteItemFromList(tasks, list_position, getAppOperations()[0]);
  }

  void updateTask(int list_position) {
    updateItemFromList(list_position, tasks, '''1 - Task name;
2 - Task start hour;
3 - Task status;''', getAppOperations()[0]);
  }

  void createImportantDate({String desc = '', String date = ''}) {
    ImportantDate important_date =
        ImportantDate(generateUniqueId(), desc, date);
    important_dates.add(important_date);
    printCrudOperationReturn(getAppOperations()[1], 'create');
  }

  void readImportantDates() {
    printList(
        list: important_dates,
        app_operation: getAppOperations()[1],
        title: 'IMPORTANT DATES');
  }

  void deleteImportantDate(int list_position) {
    deleteItemFromList(important_dates, list_position, getAppOperations()[1]);
  }

  void updateImportantDate(int list_position) {
    updateItemFromList(list_position, important_dates, '''1 - Date desc;
2 - Date;''', getAppOperations()[1]);
  }

  void createRecurringAction({String desc = '', String date = ''}) {
    Action recurring_action = Action(generateUniqueId(), desc, date);
    recurring_actions.add(recurring_action);
    printCrudOperationReturn(getAppOperations()[2], 'create');
  }

  void readRecurringActions() {
    printList(
        list: recurring_actions,
        app_operation: getAppOperations()[2],
        title: 'RECURRING ACTIONS');
  }

  void deleteRecurringAction(int list_position) {
    deleteItemFromList(recurring_actions, list_position, getAppOperations()[2]);
  }

  void updateRecurringAction(int list_position) {
    updateItemFromList(list_position, important_dates, '''1 - Action desc;
2 - Last date;''', getAppOperations()[2]);
  }
}
