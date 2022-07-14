
import 'package:flutter3/src/database/fetch_data.dart';
import 'package:flutter3/src/database/register_login.dart';

class ModelsUsers {
  //Persist  the seller details in DB

  bool? sellerDetailsPersisted;
  Future<bool?>? persistSellerDetails(
    String? nameValue,
    String? addressValue,
    double? latValue,
    double? longValue,
  ) async {
    sellerDetailsPersisted = await PersistData().saveSellerDetails(
      nameValue,
      addressValue,
      latValue,
      longValue,
    );
    return sellerDetailsPersisted;
  }

  List? sellerDetails;
  Future<List?>? getSellerDetails() async {
    await FetchData().sellerDetailsResult();
    return sellerDetails!;
  }

  //Searching the address model
  List? fetchedAddressFuture;
  Future<List?>? getSearchedAddressFuture(String? address) async{
    fetchedAddressFuture = await FetchData().fetchedAddressResult(address);
    return fetchedAddressFuture;
  }
}
