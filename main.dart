import 'util/util.dart';
import 'util/output.dart';
import 'util/crud_input.dart';
import 'util/input.dart';
import 'App.dart';
import 'dart:io';

/**
Título: Explorando Orientação a Objetos em Dart com CRUD
Descrição:
Nesta atividade, você irá explorar os conceitos de orientação a objetos aplicando-os na
linguagem Dart, com foco na criação de um CRUD (Create, Read, Update, Delete). Um
CRUD é uma operação básica utilizada em sistemas de gerenciamento de banco de dados
que permite criar, recuperar, atualizar e deletar registros.

Desenvolvido por Laura Vivan Gonçalves
*/

void main() {
  App myApp = new App(generateUniqueId());
  
  void start() {
    printDivisor();
    if (myApp.mood.desc.length > 0) {
      stdout.write('\nFeeling... ');
      writeColoredText('${myApp.mood.desc}', 'B690E7');
      stdout.write(' today\n\n');
    }
    
    String userChoice = getStringInput(toWrite: false, text: '''MAIN MENU
1 - Work with my daily tasks;
2 - Work with my recurring actions;
3 - Work with my important dates;
4 - Register my mood;
5 - Get my mood history;
6 - Exit;''');
    
    printDivisor();

    switch (userChoice) {
      case '1':
        String operation = getAppOperations()[0];
        handleCrudMenuOperation(operation, myApp);
        start();
        break;
      case '2':
        String operation = getAppOperations()[2];
        handleCrudMenuOperation(operation, myApp);
        start();
        break;
      case '3':
        String operation = getAppOperations()[1];
        handleCrudMenuOperation(operation, myApp);
        start();
        break;
      case '4':
        String user_mood = getStringInput(text: "\nWhat's your mood today? ");
        myApp.mood.desc = user_mood;
        myApp.addToMoodsHistory = myApp.mood;
        start();
        break;
      case '5':
        myApp.showMoodsHistory();
        start();
        break;
      case '6':
        print('\nShutting down...');
        print('Bye bye :)');
        break;
      default:
        start();
        break;
    }
  }

  printColoredText('Welcome to FocusFusion 🙂\n', 'B47CCE');
  start();
}  