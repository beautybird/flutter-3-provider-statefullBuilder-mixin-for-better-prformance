import 'package:postgres/postgres.dart';

class PersistData {
  PostgreSQLConnection? connection;
  Future<PostgreSQLConnection>? connOpen;

  PersistData() {
    connection = (connection == null || connection!.isClosed == true
        ? PostgreSQLConnection(
            'your DB IP address',
            5432,
            'your DB name',
            username: 'your DB name',
            password: 'your DB password',
            timeoutInSeconds: 30,
            queryTimeoutInSeconds: 30,
            timeZone: 'UTC',
            useSSL: false,
            isUnixSocket: false,
          )
        : connection);
  }

  PostgreSQLResult? saveSellerDetailsResult;
  bool? sellerDetailsSaved;
  Future<bool?>? saveSellerDetails(String? nameValue, String? addressValue,
      double? latValue, double? longValue) async {

    try{
      await connection!.open();
      await connection!.transaction((sellerDetailsConn) async {
        saveSellerDetailsResult = await sellerDetailsConn.query(
          'insert into extra.register(exNameDB,exAddressDB,exLatDB,exLngDB) '
              'where (exNameDB = @exNameValue,exAddressDB = @exAddressValue,'
              'exLatDB= @exLatValue,exLngDB = @exLngValue)',
          substitutionValues: {
            'exNameValue': nameValue,
            'exAddressValue': addressValue,
            'exLatValue': latValue,
            'exLngValue': longValue,
          },
          allowReuse: true,
          timeoutInSeconds: 30,
        );
        if (saveSellerDetailsResult!.affectedRowCount > 0) {
          sellerDetailsSaved = true;
        } else {
          sellerDetailsSaved = false;
        }
      });
    }catch(exc){
      sellerDetailsSaved = false;
      exc.toString();
    }
    return sellerDetailsSaved;
  }
}
