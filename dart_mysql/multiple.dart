import 'dart:async';
import 'package:dart_mysql/connection.dart';

main(List<String> args) async {
  var conn = await MySql.connect(
      host: 'localhost',
      // port: 3306,
      user: 'root',
      // password: '',
      db: 'dart_mysql');

  await conn
      .queryMulti('INSERT INTO users (first_name, last_name) VALUES (?, ?)', [
    ['pombo1', 'cavalo1'],
    ['pombo2', 'cavalo2'],
    ['pombo3', 'cavalo3'],
    ['pombo4', 'cavalo4'],
    ['pombo5', 'cavalo5'],
  ]);

  conn.close();
}
