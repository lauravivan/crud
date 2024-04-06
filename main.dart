import 'util.dart';

/* Autora: Laura Vivan Gonçalves */

// Disciplina de Dispositivos Móveis

/*
Nome da Tarefa:
Atividade CRUD : Comporá avaliação de atividades
Descrição:
Desenvolver um programa para realizar um CRUD de pessoas que manipule os seguintes dados: nome, idade e altura. Usar lista como base de dados.
*/

void main() {
  List<Map<String, dynamic>> people = [];

  List<Map<String, dynamic>> getPeople() {
    return people;
  }

  void listPeople() {
    print('\nPeople registered so far:');
    print('ID | NAME | AGE | HEIGHT');
    for (var person in getPeople()) {
      print(
          '${person['id']} | ${person['name']} | ${person['age']} | ${person['height']}');
    }
  }

  void createPerson(
      {dynamic id = 0, String name = '', int age = 0, double height = 0.0}) {
    Map<String, dynamic> person = {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
    };

    people.add(person);

    showReturn('created', id, name, age, height);
  }

  void updatePerson(personId, data) {
    int index = getPeople().indexWhere((person) => person['id'] == personId);
    var person = getPeople()[index];

    if (data.containsKey('name')) {
      person['name'] = data['name'];
    }

    if (data.containsKey('age')) {
      person['age'] = data['age'];
    }

    if (data.containsKey('height')) {
      person['height'] = data['height'];
    }

    showReturn(
        'updated', personId, person['name'], person['age'], person['height']);
  }

  void deletePerson(personId) {
    var personDeleted = {};

    for (var person in getPeople()) {
      if (person['id'] == personId) {
        personDeleted = person;
      }
    }

    getPeople().removeWhere((person) => person['id'] == personId);

    showReturn('deleted', personDeleted['id'], personDeleted['name'],
        personDeleted['age'], personDeleted['height']);
  }

  void start() {
    String uInput = getMainMenu();

    switch (uInput) {
      case 'create':
        int qnt = getActionQuantity('register');
        int initial = 1;

        while (initial <= qnt) {
          dynamic personId = receiveId('\nID: ');
          bool newId = true;

          for (var person in getPeople()) {
            if (person['id'] == personId) {
              newId = false;
            }
          }

          if (newId) {
            var data = receiveInfo();

            createPerson(
                id: personId,
                name: data['name'],
                age: data['age'],
                height: data['height']);

            initial++;
          } else {
            print("There's already a person with this id, try another please.");
          }
        }

        if (toQuit()) {
          break;
        } else {
          start();
          break;
        }

      case 'update':
        var peopleRegistered = getPeople();

        if (verifyPeopleListEmpty(people)) {
          start();
          break;
        }

        int qnt = validateActionQuantity('update', peopleRegistered.length);
        int initial = 1;

        while (initial <= qnt) {
          dynamic personId =
              receiveId('\nWhich person u want to update? Inform id: ');

          bool res = personExists(personId, peopleRegistered);

          if (res) {
            String uInput = getUpdateMenu();

            switch (uInput) {
              case 'n/a/h':
                var data = receiveInfo();
                updatePerson(personId, data);
                initial++;
                break;
              case 'n/a':
                var data = receiveInfo(height: false);
                updatePerson(personId, data);
                initial++;
                break;
              case 'a/h':
                var data = receiveInfo(name: false);
                updatePerson(personId, data);
                initial++;
                break;
              case 'n/h':
                var data = receiveInfo(age: false);
                updatePerson(personId, data);
                initial++;
                break;
              case 'n':
                var data = receiveInfo(age: false, height: false);
                updatePerson(personId, data);
                initial++;
                break;
              case 'a':
                var data = receiveInfo(name: false, height: false);
                updatePerson(personId, data);
                initial++;
                break;
              case 'h':
                var data = receiveInfo(name: false, age: false);
                updatePerson(personId, data);
                initial++;
                break;
              default:
                initial--;
                print("\n Wrong option. Let's try again...");
            }
          } else {
            print(
                "Sorry, there's no person with this id registered. Please try again.");
          }
        }

        if (toQuit()) {
          break;
        } else {
          start();
          break;
        }

      case 'delete':
        verifyPeopleListEmpty(people) ? start() : "";

        int qnt = validateActionQuantity('delete', getPeople().length);
        int initial = 1;

        while (initial <= qnt) {
          dynamic personId =
              receiveId('\nWhich person u want to delete? Inform id: ');

          bool res = personExists(personId, getPeople());

          if (res) {
            deletePerson(personId);
            initial++;
          } else {
            print(
                "Sorry, there's no person with this id registered. Please try again.");
          }
        }

        if (toQuit()) {
          break;
        } else {
          start();
        }

      case 'list':
        verifyPeopleListEmpty(people) ? start() : "";
        listPeople();

        if (toQuit()) {
          break;
        } else {
          start();
        }

      default:
        print("Wrong option, let's try again.");
        start();
    }
  }

  print('Welcome to register people!');
  start();
}
