import 'dart:io';

void printColoredText(String text, String colorHex) {
  String res = getColoredText(text, colorHex);
  print(res);
}

void writeColoredText(String text, String colorHex) {
  String res = getColoredText(text, colorHex);
  stdout.write(res);
}

String getColoredText(String text, String colorHex) {
  int r = int.parse(colorHex.substring(0, 2), radix: 16);
  int g = int.parse(colorHex.substring(2, 4), radix: 16);
  int b = int.parse(colorHex.substring(4, 6), radix: 16);

  return '\x1B[38;2;$r;$g;${b}m$text\x1B[0m';
}

void printCrudOperationReturn(String app_operation, String crud_operation) {
  String phrase = '\n${app_operation.trim()} ${crud_operation.trim()}d successfully';
  print(phrase);
}