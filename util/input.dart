import 'dart:io';

String getStringInput({bool toWrite = true, String text = ''}) {
  if (toWrite) {
    stdout.write(text);
  } else {
    print(text);
  }

  String user_input = stdin.readLineSync().toString();
  return user_input;
}
