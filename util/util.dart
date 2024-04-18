import 'dart:math';
import 'input.dart';
import '../App.dart';
import 'output.dart';

String generateUniqueId() {
  Random random = Random();
  String charset =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String id = '';

  for (int i = 0; i < 20; i++) {
    int random_index = random.nextInt(charset.length);
    id += charset[random_index];
  }

  return id;
}

void printStatusMenu() {
  print('''Status options: 
1 - To Do (yellow)
2 - In Progress (orange)
3 - On hold (blue)
4 - Blocked (red)
5 - Completed (green)
6 - Deferred (gray)
7 - Cancelled (purple)''');
}

String getDateNow() {
  dynamic month = DateTime.now().month;
  dynamic day = DateTime.now().day;

  if (month <= 9) {
    month = '0${month}';
  }

  if (day <= 9) {
    day = '0${day}';
  }

  return '${month}/${day}/${DateTime.now().year}';
}

String getExtractedNumbers(string) {
  String string_trim = string.trim();
  String string_clean = string_trim.replaceAll(RegExp(r'\D'), '');

  return string_clean;
}

String getExtractedLetters(string) {
  String string_trim = string.trim();
  String string_clean = string_trim.replaceAll(RegExp(r'[^a-zA-Z]'), '');

  return string_clean;
}

String getFailMsg() {
  return 'Something went wrong, please try again.';
}

int getItemPosition(List list, item) {
  int item_index = list.indexOf(item);
  int item_position = item_index + 1;

  return item_position;
}

int getListPosition(String user_position) {
  String user_position_clean = getExtractedNumbers(user_position);

  if (user_position_clean.length > 0) {
    int position_parsed = int.parse(user_position_clean);
    int list_position = position_parsed - 1;
    return list_position;
  }

  return -1;
}

List<String> getAppOperations() {
  return ['task', 'importante date', 'recurring action', 'mood'];
}

List<dynamic>? getAppOperationOperations(String app_operation, App app) {
  List? app_operation_operations;

  if (app_operation.contains('task')) {
    app_operation_operations = [app.createTask, app.updateTask, app.deleteTask, app.readTasks, app.tasks]; 
  }

  if (app_operation.contains('date')) {
    app_operation_operations = [app.createImportantDate, app.updateImportantDate, app.deleteImportantDate, app.readImportantDates, app.important_dates]; 
  }

  if (app_operation.contains('action')) {
    app_operation_operations = [app.createRecurringAction, app.updateRecurringAction, app.deleteRecurringAction, app.readRecurringActions, app.recurring_actions]; 
  }

  return app_operation_operations;
}

void printDivisor() {
  String divisor = '-' * 50;
  print(divisor);
}