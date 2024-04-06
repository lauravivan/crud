import 'dart:io';

Map<String, dynamic> receiveInfo(
    {bool name = true, bool age = true, bool height = true}) {
  String personName = '';
  Map<String, dynamic> data = {};

  if (name) {
    print('\nName: ');
    personName = stdin.readLineSync().toString().trim();
    data['name'] = personName;
  }

  if (age) {
    print('\nAge: ');
    String userInput = stdin.readLineSync().toString().trim();
    bool res = isInputValid('int', userInput);
    int personAge = 0;

    res ? personAge = int.parse(userInput) : '';

    data['age'] = personAge;
  }

  if (height) {
    print('\nHeight: ');
    String userInput = stdin.readLineSync().toString().trim();
    bool res = isInputValid('double', userInput);
    double personHeight = 0.0;

    res ? personHeight = double.parse(userInput) : "";

    data['height'] = personHeight;
  }

  return data;
}

dynamic receiveId(phrase) {
  while (true) {
    print(phrase);
    dynamic personId = stdin.readLineSync().toString();

    if (personId.length > 0) {
      return personId.trim();
    }
  }
}

String getMainMenu() {
  print('\nChoose one of the options below: ');
  print('\ncreate: for create a person');
  print('update: for update a person');
  print('delete: for delete a person');
  print('list: for list people');
  print('');
  String userChoice = stdin.readLineSync().toString();
  return userChoice.trim();
}

String getUpdateMenu() {
  print('\nWhich information u want to update?');
  print('n/a/h: for all');
  print('n: for name');
  print('a: for age');
  print('h: for height');
  print('n/a: for name and age');
  print('a/h: for age and height');
  print('n/h: for name and height');
  print('');

  String userChoice = stdin.readLineSync().toString();
  return userChoice.trim();
}

bool toQuit() {
  while (true) {
    print('\nWant to quit? (y/n)');
    String userChoice = stdin.readLineSync().toString().trim();

    if (userChoice == 'y') {
      print('\nBye bye :)');
      return true;
    } else if (userChoice == 'n') {
      return false;
    }
  }
}

bool verifyPeopleListEmpty(people) {
  if (people.length == 0) {
    print('There are no people registered. Register first please.');
    return true;
  }

  return false;
}

void showReturn(String action, personId, personName, personAge, personHeight) {
  print(
      '\nPerson ${action}: ${personId} - ${personName}, ${personAge} years, ${personHeight} height');
}

bool isInputValid(type, userInput) {
  dynamic isUserInputValid = "";

  switch (type) {
    case 'int':
      isUserInputValid = int.tryParse(userInput);
      break;
    case 'double':
      isUserInputValid = double.tryParse(userInput);
      break;
    default:
      isUserInputValid = int.tryParse(userInput);
  }

  if (userInput.length > 0 && isUserInputValid != null) {
    return true;
  }

  return false;
}

int getActionQuantity(action) {
  print('How many people do you want to ${action}?');
  String userInput = stdin.readLineSync().toString().trim();
  int quantity = 1;

  bool res = isInputValid('int', userInput);

  if (res) {
    int inputParsed = int.parse(userInput);

    if (inputParsed >= 1) {
      quantity = inputParsed;
    }
  }

  return quantity;
}

int validateActionQuantity(action, peopleLength) {
   int qnt = getActionQuantity(action);
  
  while (true) {
    if (qnt <= peopleLength) {
      break;
    } else {
      print(
          "Currently there's ${peopleLength} people registered. Less than the number you're informing.");
    }

    qnt = getActionQuantity(action);
  }

  return qnt;
}

bool personExists(personId, people) {
  return people.any((person) => person['id'] == personId);
}

