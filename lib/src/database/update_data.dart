import 'package:postgres/postgres.dart';

class UpdateDetails {
  PostgreSQLConnection? connection;

  UpdateDetails() {
    /*..Create Postgres Connection....*/
    connection = (connection == null || connection!.isClosed == true
        ? PostgreSQLConnection('192.168.0.100', 5432, 'myapp',
            username: 'myapp_admin',
            password: 'asad1122',
            timeoutInSeconds: 30,
            timeZone: 'UTC',
            useSSL: false,
            isUnixSocket: false,
            queryTimeoutInSeconds: 30)
        : connection);
  }
}
