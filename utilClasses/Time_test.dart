import 'Time.dart';

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
  Time time = new Time('fgsdgsdfdf');
  Time time2 = new Time('13:70');
  Time time3 = new Time('2:80');

  String expected_result = '0:0 PM';

  print(time.time);
  print(time2.time);
  print(time3.time);

  if ((time.time == expected_result) 
      && (time2.time == expected_result) 
      && (time3.time == expected_result)) {
    testPassed(test_desc);
  } else {
    testFailed(test_desc);
  }
}

void testValidInput() {
  String test_desc = 'testValidInput()';
  Time time = new Time('11');
  Time time2 = new Time('01:3');
  Time time3 = new Time('1:0');
  Time time4 = new Time('11:71');
  Time time5 = new Time('1:03');
  Time time6 = new Time('1112');
  Time time7 = new Time('111');

  String expected_time = '11:0 PM';
  String expected_time2 = '1:0 PM';
  String expected_time3 = '10:0 PM';
  String expected_time4 = '11:0 PM';
  String expected_time5 = '10:3 PM';
  String expected_time6 = '11:12 PM';
  String expected_time7 = '11:1 PM';

  print(time.time);
  print(time2.time);
  print(time3.time);
  print(time4.time);
  print(time5.time);
  print(time6.time);
  print(time7.time);

  if ((time.time == expected_time) 
     && (time2.time == expected_time2)
     && (time3.time == expected_time3)
     && (time4.time == expected_time4)
     && (time5.time == expected_time5)
     && (time6.time == expected_time6)
     && (time7.time == expected_time7)) {
    testPassed(test_desc);
  } else {
    testFailed(test_desc);
  }
}