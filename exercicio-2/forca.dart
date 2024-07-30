import 'package:word_generator/word_generator.dart';
import 'dart:io';

String palavraSorteada = getPalavraSorteada();
final QNT_DE_CHANCES_TOTAIS = 15;
int qtdDeChancesRestantes = 15;
String mascaraPalavraSorteada = '_' * palavraSorteada.length;
String letraEscolhida = '';

void main() {
  print('----- 👽 JOGO DA FORCA 👽 -----');
  print('Desenvolvido por Laura Vivan Gonçalves');
  print('');

  iniciarJogo();
}

String getPalavraSorteada() {
  final wordGenerator = WordGenerator();
  String noun = wordGenerator.randomNoun();
  return noun;
}

void updateMascaraPalavraSorteada() {
  List<int> indexesDasLetrasAcertadas = getIndexesDasLetrasAcertadas();

  for (int i = 0; i < indexesDasLetrasAcertadas.length; i++) {
    mascaraPalavraSorteada = mascaraPalavraSorteada.replaceRange(
        indexesDasLetrasAcertadas[i],
        indexesDasLetrasAcertadas[i] + 1,
        letraEscolhida);
  }
}

List<int> getIndexesDasLetrasAcertadas() {
  List<int> indexes = [];
  int indexRef = palavraSorteada.indexOf(letraEscolhida);

  while (indexRef != -1) {
    indexes.add(indexRef);
    indexRef = palavraSorteada.indexOf(letraEscolhida, indexRef + 1);
  }

  return indexes;
}

void setLetra() {
  stdout.write('Escolha uma letra: ');
  String usuarioInput = stdin.readLineSync()!;

  String letra = usuarioInput.substring(0);

  letraEscolhida = letra.toLowerCase();
}

bool isLetraNaPalavra() {
  return palavraSorteada.contains(letraEscolhida);
}

bool isJogoEmAndamento() {
  return mascaraPalavraSorteada.contains('_');
}

void iniciarJogo() {
  while (isJogoEmAndamento()) {
    setLetra();
    bool letraEstaNaPalavra = isLetraNaPalavra();

    if (letraEstaNaPalavra) {
      updateMascaraPalavraSorteada();
      print(mascaraPalavraSorteada);
    } else {
      qtdDeChancesRestantes--;

      if (qtdDeChancesRestantes == 0) {
        print('Oh no, você perdeu! A palavra sorteada foi: $palavraSorteada');
        mascaraPalavraSorteada = 'x';
      } else {
        print('Você tem $qtdDeChancesRestantes chance(s)');
        print('❌' * (QNT_DE_CHANCES_TOTAIS - qtdDeChancesRestantes));
        print('✅' * qtdDeChancesRestantes);
        print('');
      }
    }
  }

  if (mascaraPalavraSorteada == 'x') {
    jogarNovamente('Deseja jogar novamente? (s/n)');
  } else {
    jogarNovamente(
        'WIIII VOCÊ VENCEU O JOGO DA FORCA!! DESEJA JOGAR NOVAMENTE? (s/n)');
  }
}

void jogarNovamente(String textoRetorno) {
  print(textoRetorno);
  print('');
  String continuar = stdin.readLineSync()!;

  if (continuar.trim() == 's') {
    palavraSorteada = getPalavraSorteada();
    qtdDeChancesRestantes = 15;
    mascaraPalavraSorteada = '_' * palavraSorteada.length;
    letraEscolhida = '';
    iniciarJogo();
  } else {
    print('bye bye :)');
  }
}
