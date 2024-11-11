import 'dart:convert';
import 'dart:io';
import 'package:lista_mapas_cursos/controller.dart';

class Menu {
  Controller controller = Controller();
  //List<Map<String, dynamic>> listaDeCursos = []; Não precisa disso aqui. Acessando cotroller ja tem acesso a listaDeCursos.

  void iniciar() {
    String input;

    do {
      print('''Digite uma das opções:
  1 - Adicionar um curso
  2 - Remover um curso
  3 - Atualizar um curso
  4 - Reordenar lista de cursos
  5 - Ordenar alfabeticamente a lista
  6 - Mostrar a lista
  0 - Sair''');

      input = stdin.readLineSync(encoding: utf8)!;

      switch (input) {
        case '1':
          print('Digite o nome do curso para adicionar:');
          String nome = stdin.readLineSync(encoding: utf8)!;
          print('Digite o turno do curso:');
          String turno = stdin.readLineSync(encoding: utf8)!;
          print('Digite a carga horária do curso:');
          int cargaHoraria = int.parse(stdin.readLineSync(encoding: utf8)!);
          controller.adicionarDados(nome, turno, cargaHoraria);
          break;

        case '2':
          print('Digite o nome do curso para remover da lista:');
          String nome = stdin.readLineSync(encoding: utf8)!;
          //Aqui vamos procurar se o curso se encontra  na lista
          //o firstWhere vai procurar o primeiro elemento que satisfaça o que esta dentro do parêntese test.
          //no caso, vai procurar um item chamado dado: nome que é igual ao nome (input) passado pelo usuario.
          //o var é o mesmo que  Map<String, dynamic>. Nesse caso, tem opção de existir ou não que é o orElse.
          var procurandoCurso = controller.listaDeCursos.firstWhere(
            (dado) => dado['nome'] == nome,
            orElse: () => {},
          );
          if (procurandoCurso.isNotEmpty) {
            print(
                'Tem certeza que quer remover $nome da lista de cursos? Digite 1 para confirmar e 2 para cancelar:');
            String confirma = stdin.readLineSync(encoding: utf8)!;
            if (confirma == '1') {
              controller.removerCurso(nome);
            } else if (confirma == '2') {
              print('$nome foi mantido na lista');
            }
          } else {
            print('$nome não está na lista de cursos');
          }
          break;

        case '3':
          print('Digite qual curso deseja atualizar');
          String nome = stdin.readLineSync(encoding: utf8)!;
          //Essa parte procura se o curso existe para poder atualiza-lo
          var procurandoCurso = controller.listaDeCursos.firstWhere(
            (dado) => dado['nome'] == nome,
            orElse: () => {},
          );
          if (procurandoCurso.isNotEmpty) {
            print('Qual campo deseja atualizar?');
            String campo = stdin.readLineSync(encoding: utf8)!;
            print('Digite o novo valor para $campo: ');
            String novoValor = stdin.readLineSync(encoding: utf8)!;
            //procurandoCurso é um mapa que representa o curso encontrado na lista, 
            //com seus valores atuais (nome, turno, cargaHoraria).Quando a função atualizarDados() é chamada, 
            //ela precisa receber os valores dos campos que não serão modificados para manter a integridade dos dados.
            switch (campo) {
              case 'nome':controller.atualizarDados(nome, novoValor, procurandoCurso['turno'], procurandoCurso['cargaHoraria']);
                break;
              case 'turno': controller.atualizarDados(nome, procurandoCurso['nome'],novoValor, procurandoCurso['cargaHoraria']);
                break;
              case 'cargaHoraria':int novaCarga = int.tryParse(novoValor) ?? procurandoCurso['cargaHoraria']; 
              controller.atualizarDados(nome, procurandoCurso['nome'],procurandoCurso['turno'], novaCarga
              );
                break;
              default:
                print('Campo inválido.');
            }
          } else {
            print('$nome não está na lista de cursos.');
          }
          break;

        case '4':
          controller.reordenarLista();
          print('Lista ordenada aleatoriamente:');
          controller.mostrarLista();
          break;
        case '5':
          controller.ordenarAlfabeticamenteLista();
          print('Lista ordenada alfabeticamente:');
          controller.mostrarLista();
          break;
        case '6':
          controller.mostrarLista();
          break;
        case '0':
          print('Aplicação encerrada');
          break;
        default:
          print('Opção inválida, tente novamente!');
          break;
      }
    } while (input != '0');
  }
}
