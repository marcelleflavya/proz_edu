import 'dart:convert';
import 'dart:io';

void main() {
  print('''Digite a opção de exercicio:
  1 - calcular área do retângulo
  2 - Calcular área do triângulo equilátero
  3 - Calcular o raio de uma circunferência
  4 - calcular idade
  0 - para sair ''');

  String menu = stdin.readLineSync(encoding: utf8)!;

  switch (menu) {
    case '1':
      print('Digite a base do retângulo:');
      double baseR = double.parse(stdin.readLineSync(encoding: utf8)!);

      print('Digite a altura');
      double alturaR = double.parse(stdin.readLineSync(encoding: utf8)!);

      double resultadoR = baseR * alturaR;

      print('A aréa do retângulo é ${resultadoR.toStringAsFixed(2)}');

      break;

    case '2':
      print('Digite a base do triângulo:');
      double base = double.parse(stdin.readLineSync(encoding: utf8)!);

      print('Digite a altura do triângulo:');
      double altura = double.parse(stdin.readLineSync(encoding: utf8)!);

      double resultado = (base * altura) / 2;

      print('A área do triângulo é ${resultado.toStringAsFixed(2)}');
      break;

    case '3':
      print('Digite o diâmetro da circunferência:');
      double diametro = double.parse(stdin.readLineSync(encoding: utf8)!);

      double raio = diametro / 2;

      print('O raio é ${raio.toStringAsFixed(2)}');
      break;

    case '4':
      print('Digite a idade em dias:');
      int dias = int.parse(stdin.readLineSync(encoding: utf8)!);

      //considerando todos os anos com 365 dias e todos os meses com 30 dias

      int ano = dias ~/ 365;
      //Aqui pega so a parte inteira

      int restoAnos = dias % 365;
      //resto da divisao dos anos

      int meses = restoAnos ~/ 30;
      // pega a parte inteira pra ver os meses

      int dia = restoAnos % 30;
      // o resto de tudo corresponde aos dias

      print('Sua idade corresponde a $ano anos, $meses meses e $dia dias');

      break;

    case '0':
      print('Encerrando aplicação');
      break;
  }
}
