import 'package:postgres/postgres.dart';

class FetchData {
    PostgreSQLConnection? connection;

  FetchData() {
    /*..Create Postgres Connection....*/
    connection = (connection == null || connection!.isClosed == true
        ? PostgreSQLConnection('your DB IP', 5432, 'your DB name',
            username: 'your DB user name',
            password: 'your DB password',
            timeoutInSeconds: 30,
            timeZone: 'UTC',
            useSSL: false,
            isUnixSocket: false,
            queryTimeoutInSeconds: 30)
        : connection);
  }
    List<dynamic>? sellerDetailsList;
    Future<List<dynamic>>? sellerDetailsResult()async{
      return sellerDetailsList!;
    }

    // Search address future
    PostgreSQLResult? addressSearchResult;
    List<dynamic>? searchedAddressFuture;
    Future<List<dynamic>?>? fetchedAddressResult(String? address) async{
      try{
        await connection!.open();
        await connection!.transaction((connAddress) async{
          addressSearchResult = await connAddress.query(
            'select nameDB,addressDB,latDB,lngDB from schema.extra where nameDB=@nameValue ',
            substitutionValues: {
              'nameValue':address,
            },
            allowReuse: true,
            timeoutInSeconds: 30,
          );
          if(addressSearchResult!.affectedRowCount > 0){
            searchedAddressFuture = addressSearchResult;
          }else{
            searchedAddressFuture = [];
          }
        });
      }catch(exc){
        searchedAddressFuture = [];
        exc.toString();
      }
    }
}
