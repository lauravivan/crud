import 'dart:io';

void main() {
  print('');
  print('------ CALCULADORA DE OPERAÇÕES BÁSICAS ------');
  print('Criada por Laura Vivan Gonçalves');
  print('');

  int numero1 = getInputValido('Informe o primeiro número: ');
  int numero2 = getInputValido('Informe o segundo número: ');

  print('Informe o operador: ');
  String operador = stdin.readLineSync().toString().trim();

  try {
    Function resultado = operacao(operador);
    print('Resultado da operação: ${resultado(numero1, numero2)}');
  } catch (e) {
    print(e);
  }
}

Function operacao(String operador) {
  switch (operador) {
    case '+':
      return (int a, int b) => a + b;
    case '-':
      return (int a, int b) => a - b;
    case '*':
      return (int a, int b) => a * b;
    case '/':
      return (int a, int b) => a ~/ b;
    default:
      throw Exception('Operador inválido: $operador');
  }
}

bool isInputValido(var usuarioInput) {
  if (usuarioInput != null) {
    int? usuarioInputParse = int.tryParse(usuarioInput);

    if (usuarioInputParse != null) {
      return true;
    }

    return false;
  }

  return false;
}

int getInputValido(String inputTexto) {
  print(inputTexto);
  String usuarioInput = stdin.readLineSync()!;
  bool isValido = isInputValido(usuarioInput);

  while (!isValido) {
    print('⚠️ Informe um número inteiro válido ⚠️');
    print(inputTexto);
    usuarioInput = stdin.readLineSync()!;
    isValido = isInputValido(usuarioInput);
  }

  return int.parse(usuarioInput);
}
