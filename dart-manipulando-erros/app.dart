main(List<String> args) {
  int x = 24;
  int y = 2;

  try {
    if (x <= 12) {
      throw new Exception('x is <= 12');
      // throw new FormatException('x is <= 12');
    }

    // ~ -> Divisao de numeros inteiros
    var result = x ~/ y;

    print(result);
  } on IntegerDivisionByZeroException {
    print('Voce nao pode dividir numeros por zero');
    // print(e);
  } on FormatException catch (e) {
    print(e);
  } catch (e) {
    print(e);
  } finally {
    print('done');
  }
}
