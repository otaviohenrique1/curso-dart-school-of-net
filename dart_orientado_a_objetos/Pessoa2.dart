class Pessoa2 {
  // Atributos
  String nome;
  int idade;

  // Construtor
  Pessoa2(this.nome, this.idade);

  // Metodo sem retorno
  void enviarEmail() {
    String msg = 'Hello ' + nome;
    print('Enviar email');
  }
}

void main() {
  Pessoa2 pombo = new Pessoa2('Pombo', 100);
  pombo.enviarEmail();
}
