import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite/classes/usuario.dart';

class HelpDados {
  static Database? _database;
  static const String nomeTabela = 'usuarios'; // Nome da tabela de usuários

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bancopatrick.db');

    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Crie a tabela de usuários com ID auto incremento
        db.execute('''
          CREATE TABLE $nomeTabela(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            sobrenome TEXT,
            datanascimento TEXT
          )
        ''');
      },
    );

    return database;
  }

  Future<int> inserirUsuario(Usuario usuario) async {
    final db = await database;
    return await db.insert(
      nomeTabela, // Nome da tabela de usuários
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // Trata conflitos
    );
  }

  Future<List<Usuario>> obterUsuarios() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(nomeTabela);

    return List.generate(maps.length, (index) {
      return Usuario(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        sobrenome: maps[index]['sobrenome'],
        dataNascimento: maps[index]['datanascimento'],
      );
    });
  }
}
