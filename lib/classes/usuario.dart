class Usuario {
  int id;
  String nome;
  String sobrenome;
  String dataNascimento;

  Usuario({required this.id, required this.nome, required this.sobrenome, required this.dataNascimento});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'sobrenome': sobrenome,
      'dataNascimento': dataNascimento,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      sobrenome: map['sobrenome'],
      dataNascimento: map['dataNascimento'],
    );
  }
}
