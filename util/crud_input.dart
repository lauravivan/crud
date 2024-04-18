import 'input.dart';
import '../App.dart';
import 'util.dart';

//Funções para lidar com o recebimento de informações do usuário (relacionado ao crud)

String getCrudMenu(String app_operation) {
  List<String> options = ['1', '2', '3', '4', '5'];
  String user_choice = '';

  while (true) {
    printDivisor();
    print('''${app_operation.toUpperCase()} MENU
1 - Create ${app_operation};
2 - Update ${app_operation};
3 - Delete ${app_operation};
4 - Read ${app_operation}s;
5 - Go back;''');

    user_choice = getStringInput();

    printDivisor();

    if (options.contains(user_choice)) {
      break;
    }
  }

  return user_choice;
}

void handleCrudMenuOperation(String app_operation, App app) {
  while (true) {
    String u_choice = getCrudMenu(app_operation);

    if (u_choice == '5') {
      break;
    }

    switch (u_choice) {
      case '1':
        print('\nCREATE ${app_operation.toUpperCase()}');
        handleCrudOperation('create', app_operation, app);
        break;
      case '2':
        handleCrudOperation('update', app_operation, app);
        break;
      case '3':
        handleCrudOperation('delete', app_operation, app);
        break;
      case '4':
        handleCrudOperation('read', app_operation, app);
        break;
      case '5':
        break;
      default:
        break;
    }
  }
}

void handleCreateOperation(String app_operation, crudFunction) {
  if (app_operation.contains('task')) {
     printStatusMenu();

     String task_desc = getStringInput(text: 'Desc: ');
     String starts_at = getStringInput(text: 'Starts at (h:m): ');
     String ends_at = getStringInput(text: 'Ends at (h:m): ');
     String task_status = getStringInput(text: 'Status (by number): ');

     crudFunction(
         task_name: task_desc,
         starts_at: starts_at,
         ends_at: ends_at,
         task_status: task_status);
  } else {
    String desc = getStringInput(text: '${app_operation.contains('date') ? 'Date' : 'Action'} desc: ');
    String date = getStringInput(text: 'Date: ');
    crudFunction(desc: desc, date: date);
  }
}

void handleUpdateAndDeleteOperations(String app_operation, String crud_operation, List app_operation_operations) {
  String phrase =
    '\nEnter the list position of the ${app_operation} you want to ${crud_operation}: ';
  bool isListEmpty = true;

  if (app_operation_operations[4].length > 0) {
    isListEmpty = false;
  }

  if (isListEmpty) {
    print('\nNo register found. Please, create first.');
  } else {
    String user_position = getStringInput(text: phrase);
    int list_position = getListPosition(user_position);

    if (list_position >= 0 && list_position < app_operation_operations[4].length) {
      if (crud_operation == 'update') {
        app_operation_operations[1](list_position);
      }

      if (crud_operation == 'delete') {
        app_operation_operations[2](list_position);
      }
    } else {
      print("\nThe register you're trying to ${crud_operation} doesn't exist... please try again");
    }
  }
}

void handleCrudOperation(String crud_operation, String app_operation, App app) {
  List? app_operation_operations = getAppOperationOperations(app_operation, app);

  if (app_operation_operations != null) {
    if (crud_operation == 'read') {
      app_operation_operations[3]();
    } else if (crud_operation == 'create') {
      handleCreateOperation(app_operation, app_operation_operations[0]);
    } else {
      handleUpdateAndDeleteOperations(app_operation, crud_operation, app_operation_operations);
    }
  }
}
