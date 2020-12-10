import 'package:args/args.dart';
import 'package:dart_mysql/connection.dart';

main(List<String> arguments) async {
  // List<String> args -> armazena os argumendos colocados na linha de comando
  // Exemplo -> dart main.dart -a --b c -> print(arguments); -> Imprime [-a, --b, c]

  var parser = new ArgParser();

  parser.addOption('mode', defaultsTo: 'select-all', allowed: [
    'select',
    'select-all',
    'insert',
    'update',
    'delete',
    'create-table'
  ]);

  parser.addOption('id');
  parser.addOption('first_name');
  parser.addOption('last_name');

  var args = parser.parse(arguments);

  print('Executing in mode: ' + args['mode']);

  var conn = await MySql.connect(
      host: 'localhost',
      // port: 3306,
      user: 'root',
      // password: '',
      db: 'dart_mysql');

  // print(args['mode']);
  // print(args['id']);
  // print(args['first_name']);
  // print(args['last_name']);

  if (args['mode'] == 'select' ||
      (args['mode'] == 'select-all' && args['id'] != null)) {
    String sql = 'SELECT * FROM users';
    List data = [];

    if (args['id'] != null) {
      sql += ' WHERE id=?';
      data.add(args['id']);
    }

    sql += ' LIMIT 1;';

    var results = await conn.query(sql, data);
    var row = results.first;

    print('');
    print('---');
    print('id: ' + row['id'].toString());
    print('first_name: ' + row['first_name']);
    print('last_name: ' + row['last_name']);
    print('done');
  }

  if (args['mode'] == 'select-all') {
    String sql = 'SELECT * FROM users';
    List data = [];

    var results = await conn.query(sql, data);

    print('');
    print('---');

    for (var row in results) {
      print('id: ' + row['id'].toString());
      print('first_name: ' + row['first_name']);
      print('last_name: ' + row['last_name']);
      print('---');
    }

    print('Total: ' + results.length.toString());
    print('done');
  }

  if (args['mode'] == 'insert') {
    var sql = 'INSERT INTO users (first_name, last_name)  VALUES (?,?)';
    await conn.query(sql, [args['first_name'], args['last_name']]);
    print('done');
  }

  if (args['mode'] == 'update') {
    var sql = 'UPDATE users SET';
    List data = [];

    if (args['first_name'] != null) {
      sql += ' first_name=?';
      data.add(args['first_name']);
    }

    if (args['first_name'] != null && args['last_name'] != null) {
      sql += ',';
    }

    if (args['last_name'] != null) {
      sql += ' last_name=?';
      data.add(args['last_name']);
    }

    if (args['id'] != null) {
      sql += ' WHERE id=?';
      data.add(args['id']);
    }

    await conn.query(sql, data);

    print('done');
  }

  if (args['mode'] == 'delete') {
    var sql = 'DELETE FROM users';
    List data = [];

    if (args['id'] != null) {
      sql += ' WHERE id=?';
      data.add(args['id']);
    }

    await conn.query(sql, data);

    print('done');
  }

  if (args['mode'] == 'create-table') {
    var sql = """
      CREATE TABLE `users` (
        `id` int NOT NULL AUTO_INCREMENT,
        `first_name` VARCHAR(100) NOT NULL,
        `last_name` VARCHAR(100) NOT NULL,
        PRIMARY KEY(`id`)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8
    """;
    await conn.query(sql);
    print('done');
  }

  conn.close();
}
