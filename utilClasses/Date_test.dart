import 'Date.dart';

void main() {
  testInvalidInput();
  testValidInput();
}

void testPassed(test_desc) {
  print('${test_desc}: test passed');
}

void testFailed(test_desc) {
  print('${test_desc}: test failed');
}

void testInvalidInput() {
  String test_desc = 'testInvalidInput()';
  Date date = new Date('fgsdgsdfdf');
  Date date2 = new Date('21940');
  Date date3 = new Date('2/1940');
  Date date4 = new Date('10/40/2024');
  Date date5 = new Date('10/%/2024');
  Date date6 = new Date('-10/-40/2024');

  String expected_result = '0/0/0';

  print(date.date);
  print(date2.date);
  print(date3.date);
  print(date4.date);
  print(date5.date);
  print(date6.date);

  if ((date.date == expected_result) 
      && (date2.date == expected_result) 
      && (date3.date == expected_result)
     && (date4.date == expected_result)
     && (date5.date == expected_result)
     && (date6.date == expected_result)) {
    testPassed(test_desc);
  } else {
    testFailed(test_desc);
  }
}

void testValidInput() {
  String test_desc = 'testValidInput()';
  Date date = new Date('442024');
  Date date2 = new Date('1/1/2023');
  Date date3 = new Date('1/02/2023');
  Date date4 = new Date('1/27/2023');
  Date date5 = new Date('02/1/2023');
  Date date6 = new Date('10/1/2023');
  Date date7 = new Date('12/12/2023');

  String expected_date = '4/4/2024';
  String expected_date2 = '1/1/2023';
  String expected_date3 = '10/2/2023';
  String expected_date4 = '12/7/2023';
  String expected_date5 = '2/1/2023';
  String expected_date6 = '10/1/2023';
  String expected_date7 = '12/12/2023';

  print(date.date);
  print(date2.date);
  print(date3.date);
  print(date4.date);
  print(date5.date);
  print(date6.date);
  print(date7.date);

  if ((date.date == expected_date) 
     && (date2.date == expected_date2)
     && (date3.date == expected_date3)
     && (date4.date == expected_date4)
     && (date5.date == expected_date5)
     && (date6.date == expected_date6)
     && (date7.date == expected_date7)) {
    testPassed(test_desc);
  } else {
    testFailed(test_desc);
  }
}