import 'dart:async';
import 'package:mysql1/mysql1.dart';

class MySql {
  static final _singleton = new MySql._internal();

  factory MySql() {
    return _singleton;
  }

  MySql._internal();

  static MySqlConnection _connection;

  //  Exemplo com async e await
  static Future<MySqlConnection> connect(
      {String host,
      int port: 3306,
      String user,
      String password: null,
      String db}) async {
    if (_connection != null) {
      return _connection;
    }
    var settings = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );

    // Assincrono
    _connection = await MySqlConnection.connect(settings);

    return _connection;
  }

  /*
    // Exemplo com then()
    static connect(
      {String host,
      int port: 3306,
      String user,
      String password: null,
      String db}) {
      var settings = new ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: db,
      );

      // Assincrono
      MySqlConnection.connect(settings).then((result) => _connection = result);
    }
  */
}
