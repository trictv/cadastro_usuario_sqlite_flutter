import 'package:flutter/material.dart';
import 'package:sqlite/classes/usuario.dart';
import 'package:sqlite/classes/dados.dart';
import 'package:sqlite/visualizarusuario.dart';

import 'cadastrousuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Usuários',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cadastro de Usuários'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de cadastro quando o botão for pressionado
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaCadastroUsuario()));
              },
              child: const Text('Cadastrar Usuário'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de visualização de usuários quando o botão for pressionado
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaVisualizacaoUsuarios()));
              },
              child: const Text('Visualizar Todos os Usuários'),
            ),
          ],
        ),
      ),
    );
  }
}

