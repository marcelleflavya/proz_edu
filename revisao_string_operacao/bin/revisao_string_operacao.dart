import 'dart:convert';
import 'dart:io';

void main() {
  print('Digite sua idade em dias');
  int dias = int.parse(stdin.readLineSync(encoding: utf8)!);

  print('Digite seu nome completo:');
  String nomeCompleto = stdin.readLineSync(encoding: utf8)!;

  int anos = dias ~/ 365;
  //pra pegar a parte inteira que corresponde aos anos
  int resto = dias % 365;
  // o resto que vai ser usado pra calcular meses e dias
  int meses = resto ~/ 30;
  int dia = resto % 30;

  int primeiro = nomeCompleto.indexOf(' ');

  String primeiroNome = nomeCompleto.substring(0,primeiro);

  print(
      '''Olá $primeiroNome, tudo bem? De acordo com os dados fornecidos, você tem $anos anos , $meses meses , $dia dias vividos, parabéns por sua jornada!
  Seja bem vindo ao nosso curso!''');
}
