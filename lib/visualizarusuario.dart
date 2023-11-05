import 'package:flutter/material.dart';
import 'package:sqlite/classes/usuario.dart';
import 'package:sqlite/classes/dados.dart';

class TelaVisualizacaoUsuarios extends StatefulWidget {
  const TelaVisualizacaoUsuarios({Key? key}) : super(key: key);

  @override
  _TelaVisualizacaoUsuariosState createState() => _TelaVisualizacaoUsuariosState();
}

class _TelaVisualizacaoUsuariosState extends State<TelaVisualizacaoUsuarios> {
  List<Usuario> _usuarios = <Usuario>[];

  @override
  void initState() {
    super.initState();
    _carregarUsuarios();
  }

  void _carregarUsuarios() async {
    final dbHelper = HelpDados();
    final usuarios = await dbHelper.obterUsuarios();

    setState(() {
      _usuarios = usuarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualização de Usuários'),
      ),
      body: ListView.builder(
        itemCount: _usuarios.length,
        itemBuilder: (context, index) {
          final usuario = _usuarios[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${usuario.id}'),
                Text('NOME: ${usuario.nome} ${usuario.sobrenome}'),
                Text('DATA DE NASCIMENTO: ${usuario.dataNascimento}'),
              ],
            ),
          );
        },
      ),

    );
  }
}
