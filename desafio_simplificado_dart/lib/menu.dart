import 'dart:convert';
import 'dart:io';
import 'package:desafio_simplificado_dart/controller.dart';
import 'package:desafio_simplificado_dart/endereco.dart';
import 'package:desafio_simplificado_dart/socio.dart';

class Menu {
  Controller controller = Controller();

  void iniciar() {
    String input;

    do {
      print('''Digite uma opção:
1 - Cadastrar uma nova empresa:
2 - Buscar Empresa cadastrada por CNPJ;
3 - Buscar Empresa por CPF do Sócio;
4 - Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);
5 - Excluir uma empresa (por ID);
0 - Sair.''');

      input = stdin.readLineSync(encoding: utf8)!;

      switch (input) {
        case '1':
          _cadastroEmpresa();
          break;
        case '2':
          _buscarEmpresaCnpj();
          break;
        case '3':
          _buscarEmpresaCpf();
          break;
        case '4':
          controller.listarEmpresasOrdemAlfabetica();
          break;
        case '5':
          _excluirporId();
          break;
        case '0':
          print('Encerrando aplicação.');
          break;
        default:
          print('Opção inválida, tente novamente.');
          break;
      }
    } while (input != '0');
  }

  _cadastroEmpresa() {
    print('Digite a razão social da empresa:');
    String razaoSocial = stdin.readLineSync(encoding: utf8)!;
    print('Digite o nome fantasia da empresa:');
    String nomeFantasia = stdin.readLineSync(encoding: utf8)!;
    String cnpj;
    while (true) {
      print('Digite o CNPJ com apenas números:');
      cnpj = stdin.readLineSync(encoding: utf8)!;
      String? cnpjFormatado = controller.formatarCnpj(cnpj);
      if (cnpjFormatado != null) {
        cnpj = cnpjFormatado;
        break;
      }
    }
    String telefone;
    while (true) {
      print('Digite o telefone da empresa com apenas números:');
      telefone = stdin.readLineSync(encoding: utf8)!;
      String? formatarTelefone = controller.formatarTelefone(telefone);
      if (formatarTelefone != null) {
        telefone = formatarTelefone;
        break;
      }
    }
    Endereco endereco = controller.cadastroEndereco();
    Socio socio = controller.cadastroSocio();
    controller.cadastroEmpresa(
        razaoSocial, nomeFantasia, cnpj, telefone, socio, endereco);
  }

  void _buscarEmpresaCnpj() {
    if (controller.informacoesEmpresas.isEmpty) {
      print('A lista está vazia.');
      return;
    }
    print('Digite o CNPJ da empresa com apenas números:');
    String cnpj = stdin.readLineSync(encoding: utf8)!;
    controller.buscarEmpresaCnpj(cnpj);
  }

  void _buscarEmpresaCpf() {
    if (controller.informacoesEmpresas.isEmpty) {
      print('A lista está vazia.');
      return;
    }
    print('Digite o CPF do sócio da empresa:');
    String cpf = stdin.readLineSync(encoding: utf8)!;
    controller.buscarEmpresaCpf(cpf);
  }

  void _excluirporId() {
    if (controller.informacoesEmpresas.isEmpty) {
      print('A lista está vazia.');
      return;
    }
    print('Digite o ID da empresa:');
    String id = stdin.readLineSync(encoding: utf8)!;
    controller.excluirPorId(id);
  }
}
