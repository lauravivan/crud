import 'dart:io';

void main() {
  Map<String, String> valoresUsuario = getUsuarioInfo(mostraHeader, mostraMenu);

  try {
    bool opcaoValida = isOpcaoValida(valoresUsuario['opcaoEscolhida']!);

    if (opcaoValida) {
      Function resultadoDaOperacao = menu(valoresUsuario['opcaoEscolhida']!);

      List<int> lista = getListaLimpa(valoresUsuario['listaUsuario']!);

      print('');
      print('👇 Resultado da operação escolhida 👇');
      resultadoDaOperacao(lista);
    }
  } catch (e) {
    print(e);
  }
}

Function menu(String operation) {
  switch (operation) {
    case '1':
      return (List<int> lista) {
        stdout.write(
            'Aqui está sua lista ordenada crescente: ${ordenaCres(lista)}\n');
      };
    case '2':
      return (List<int> lista) {
        stdout.write(
            'Aqui está sua lista ordenada decrescente: ${ordenaDecres(lista)}\n');
      };
    case '3':
      return (List<int> lista) {
        stdout.write('O maior valor da lista é: ${getMaiorValor(lista)}\n');
      };
    case '4':
      return (List<int> lista) {
        stdout.write('A média dos valores da lista é: ${getMedia(lista)}\n');
      };
    default:
      throw Exception('Opção inválida: $operation');
  }
}

List<int> ordenaCres(List<int> lista) {
  lista.sort();
  return lista;
}

List<int> ordenaDecres(List<int> lista) {
  lista.sort((a, b) => b.compareTo(a));
  return lista;
}

int getMaiorValor(List<int> lista) {
  if (lista.isEmpty) return 0;
  return lista.reduce((a, b) => a > b ? a : b);
}

double getMedia(List<int> lista) {
  if (lista.isEmpty) return 0;
  int soma = lista.reduce((a, b) => a + b);
  return soma / lista.length;
}

List<int> getListaLimpa(String lista) {
  String listaLimpa = lista.trim();

  listaLimpa = listaLimpa.replaceAll('.', '');
  listaLimpa = listaLimpa.replaceAll(RegExp(r'[^0-9,]'), '');
  listaLimpa = listaLimpa.replaceAll(RegExp(r',$'), '');

  List<String> listaDeStrings = listaLimpa.split(',');

  List<int> listaDeInteiros = listaDeStrings.map((e) {
    int? numero = int.tryParse(e);
    return numero ?? 0;
  }).toList();

  return listaDeInteiros;
}

bool isOpcaoValida(String opcao) {
  switch (opcao) {
    case '1':
    case '2':
    case '3':
    case '4':
      return true;
    default:
      throw Exception('Opção inválida: $opcao');
  }
}

void mostraHeader() {
  print('');
  print('Desenvolvido por Laura Vivan Gonçalves');
  print('');
}

void mostraMenu() {
  print('Escolha uma opção do menu:');
  print('----- MENU -----');
  print('1- Ordenação crescente');
  print('2- Ordenação decrescente');
  print('3- Maior valor');
  print('4- Média dos valores');
}

Map<String, String> getUsuarioInfo(Function mostraHeader, Function mostraMenu) {
  mostraHeader();

  stdout
      .write('Informe uma lista de números inteiros (separados por vírgula): ');
  String listaUsuario = stdin.readLineSync()!;

  mostraMenu();

  stdout.write('Opção escolhida: ');

  String opcaoEscolhida = stdin.readLineSync()!;

  return {'listaUsuario': listaUsuario, 'opcaoEscolhida': opcaoEscolhida};
}
