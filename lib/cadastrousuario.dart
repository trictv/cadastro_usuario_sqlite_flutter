import 'package:flutter/material.dart';
import 'package:sqlite/classes/usuario.dart';
import 'package:sqlite/classes/dados.dart';

class TelaCadastroUsuario extends StatefulWidget {
  const TelaCadastroUsuario({Key? key}) : super(key: key);

  @override
  _TelaCadastroUsuarioState createState() => _TelaCadastroUsuarioState();
}

class _TelaCadastroUsuarioState extends State<TelaCadastroUsuario> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _sobrenomeController,
              decoration: const InputDecoration(labelText: 'Sobrenome'),
            ),
            TextField(
              controller: _dataNascimentoController,
              decoration: const InputDecoration(labelText: 'Data de Nascimento'),
            ),
            ElevatedButton(
              onPressed: () {
                _cadastrarUsuario();
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  void _cadastrarUsuario() async {
    final nome = _nomeController.text;
    final sobrenome = _sobrenomeController.text;
    final dataNascimento = _dataNascimentoController.text;

    if (nome.isEmpty || sobrenome.isEmpty || dataNascimento.isEmpty) {
      _exibirMensagem('Preencha todos os campos.');
      return;
    }

    final dbHelper = HelpDados();
    final novoUsuario = Usuario(
      id: 0, // O ID será gerado automaticamente com AUTOINCREMENT
      nome: nome,
      sobrenome: sobrenome,
      dataNascimento: dataNascimento,
    );

    int resultado = await dbHelper.inserirUsuario(novoUsuario);
    if (resultado != -1) {
      _exibirMensagem('Cadastro bem-sucedido.');

      // Limpar os campos de entrada
      _nomeController.clear();
      _sobrenomeController.clear();
      _dataNascimentoController.clear();
    } else {
      _exibirMensagem('Erro ao cadastrar. Tente novamente.');
    }
  }

  void _exibirMensagem(String mensagem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(mensagem),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o AlertDialog
                if (mensagem == 'Cadastro bem-sucedido.') {
                  // Navegar de volta para a tela inicial (Main.dart) após o sucesso
                  Navigator.of(context).pop();
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
