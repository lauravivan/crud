import 'output.dart';
import 'util.dart';
import 'input.dart';
import '../utilClasses/Time.dart';

//Funções para realizar as operações de crud

void deleteItemFromList(List list, int list_position, String app_operation) {
  int list_size = list.length;

  if (list_position >= 0 && list_position < list.length) {
    list.removeAt(list_position);
    (list_size > list.length) ? printCrudOperationReturn(app_operation, 'delete') : print(getFailMsg());
  } else {
    print(
        "\nThe item you're trying to delete doesn't exist. Please try again.");
  }
}

void printList({List? list, String app_operation = '', String title = ''}) {
  if (list != null) {
    if (list.length > 0) {
      printDivisor();
      print("MY ${app_operation.contains('task') ? 'DAILY ' : ''}${title}\n");
      
      for (var item in list) {
        int position = getItemPosition(list, item);
        String info = item.getInfo();
        String item_info = '(${position}) ';

        if (info.length > 0) {
          item_info += '${info}';
          
          if (app_operation == 'task') {
            String? color = item.status['color'];
            writeColoredText(item_info, '${color}');
            print('');
          } else {
            print(item_info);
          }
        } else {
          item_info += 'No info registered for this ${app_operation}';
          print(item_info);
        }
      }
      printDivisor();
    } else {
      print('\nNo register found');
    }
  }
}

void updateItemFromList(int list_position, List list, String optionsText, String app_operation) {
  print('\nWhich information you want to update?');
  String info_to_update = getStringInput(toWrite: false, text: optionsText);

  if (app_operation.contains('task')) {
    updateItemFromTaskList(info_to_update, list_position, list);
  } else {
    switch (info_to_update) {
      case '1':
        String desc = getStringInput(text: '\n${app_operation.contains('action') ? 'Action' : 'Date'} desc: ');
        list[list_position].desc = desc;
        break;
      case '2':
        String date = getStringInput(text: '\nLast date: ');
        list[list_position].setDate(date);
        break;
      default:
        break;
    }
  }

  printCrudOperationReturn(app_operation, 'update');
}

void updateItemFromTaskList(String info_to_update, int list_position, List list) {
  switch (info_to_update) {
    case '1':
      String task_name = getStringInput(text: '\nTask name: ');
      list[list_position].desc = task_name;
      break;
    case '2':
      String start_hour = getStringInput(text: '\nTask start hour: ');
      list[list_position].starts_at = Time(start_hour);

      String edit_end_hour = getStringInput(
          toWrite: false, text: '\nDo you want to edit end hour? (y/n)');

      while (true) {
        if (edit_end_hour.trim() == 'y') {
          String end_hour = getStringInput(text: '\nTask end hour: ');
          list[list_position].ends_at = Time(end_hour);
          break;
        }

        if (edit_end_hour.trim() == 'n') {
          break;
        }
      }
      break;
    case '3':
      print('');
      printStatusMenu();
      String task_status = getStringInput(text: '\nTask status (by number): ');
      list[list_position].setStatus(task_status);
      break;
    default: 
      break;
  }
}