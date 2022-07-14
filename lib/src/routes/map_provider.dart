import 'dart:async';
import 'dart:typed_data';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter3/src/map/map_provider/map_provider.dart';
import 'package:flutter3/src/models/tasneem_models.dart';
import 'package:flutter3/src/providers/search_address.dart';
import 'package:flutter3/src/settings/settings_controller.dart';
import 'package:flutter3/src/shared_widgets/form_text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MapProviderPage extends StatefulWidget {
  static const routeName = "/mapProviderPage";
  final SettingsController? controller;

  const MapProviderPage({Key? key, this.controller}) : super(key: key);

  @override
  State<MapProviderPage> createState() => _MapProviderPageState();
}

class _MapProviderPageState extends State<MapProviderPage> {
  Color baseColor = const Color(0xFFF2F2F2);

  //Form key
  final _addressFormKey = GlobalKey<FormState>();
  //Address Text Field
  final _nameTextController = TextEditingController();
  final _addressTextController = TextEditingController();

  String? nameText;
  String? _getNAmeText() {
    nameText = ((_nameTextController.text).isNotEmpty == true
        ? _nameTextController.text
        : '');
    return nameText;
  }

  String? addressText;
  String? _getAddressText() {
    addressText = ((_addressTextController.text).isNotEmpty == true
        ? _addressTextController.text
        : '');
    return addressText;
  }

  //Provider values
  MapProvider? mapProviderInstance;
  String? description;
  double? latValue;
  double? lngValue;

  List<double?>? latLngValuesList = List.empty(growable: true);

  //Display places to UI
  Completer<GoogleMapController?>? _mapController = Completer();
  StreamSubscription? locationSubscription;

  //StreamSubscription? boundsSubscription;
  //final _locationController = TextEditingController();

  listenToSelectedLocation() {
    //Listen for selected Location
    locationSubscription =
        mapProviderInstance!.selectedLocation!.stream.listen((place) {
      if (place != null) {
        //Once the searched text found with Google Map Database
        // we save it in the text field ..and get it's details
        description = _addressTextController.text = place.name!;
        latValue = place.geometrySearch!.locationSearch!.lat!;
        lngValue = place.geometrySearch!.locationSearch!.lng!;

        locationSubscription!.cancel();
      } else
        _addressTextController.text = "";
    });
  }

  //If the location searches(street) not available,
  //then we select the city where this location exist
  searchAddressNotExistInGoogleMap() {}

  // When user search the app DB for certain company or name
  final _searchedAddressFormKey = GlobalKey<FormState>();
  final _searchedAddressController = TextEditingController();

  String? _searchedAddressFromDB;
  String? _getSearchedAddressFromDB() {
    _searchedAddressFromDB =
        ((_searchedAddressController.text).isNotEmpty == true
            ? _searchedAddressController.text
            : '');
    return _searchedAddressFromDB;
  }

  @override
  void initState() {
    // TODO: implement initState
    description = 'No Selected Address';
    super.initState();
    _nameTextController.addListener(() {
      _getNAmeText();
    });
    _addressTextController.addListener(() {
      _getAddressText();
    });

    //
    _searchedAddressController.addListener(() {
      _getSearchedAddressFromDB();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _addressTextController.dispose();
    //
    _searchedAddressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var addressResultProvider = Provider.of<SearchAddressProvider>(context);

    return Scaffold(
      appBar: AppBar(title:const Text('Google Mao With Prvider'),),
      body: ListView(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            constraints: const BoxConstraints(
              minWidth: 300.0,
              minHeight: 80.0,
            ),
            color: Colors.white,
            child: Form(
              key: _addressFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    color: Colors.lightGreen[100],
                    elevation: 10,
                    child: StandardFormTextField(
                      controller: _nameTextController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      fontSize: 15.0,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w400,
                      icon: CarbonIcons.person,
                      tooltip: 'Name Text',
                      formTextFieldLabel: "Name Text",
                      obsecureText: false,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    color: Colors.lightGreen[100],
                    elevation: 10.0,
                    child: StandardFormTextField(
                        controller: _addressTextController,
                        textInputType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        fontSize: 15.0,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w400,
                        icon: CarbonIcons.road,
                        tooltip: 'Address Text',
                        formTextFieldLabel: "Address Text",
                        obsecureText: false,
                        maxLines: 1,
                        onChanged: (stringValue) {
                          //search result..saved in a map provider
                          mapProviderInstance!.searchPlaces(stringValue);

                          //If search returns values ..or not
                          Timer(const Duration(seconds: 3), () {
                            if (mapProviderInstance!.places!.isNotEmpty == true) {
                              listenToSelectedLocation();
                            } else {
                              searchAddressNotExistInGoogleMap();
                            }
                          });
                        }),
                  ),
                  const SizedBox(height: 5.0),
                  IconButton(
                    iconSize: 35.0,
                    color: Colors.blue,
                    splashColor: Colors.pinkAccent,
                    splashRadius: 30.0,
                    tooltip: 'Search The Address',
                    icon: const Icon(
                      CarbonIcons.save,
                      //color: Colors.purple,
                      size: 35.0,
                    ),
                    onPressed: () {
                      //
                      sellerDetailsMethod(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 20.0,
            thickness: 2.0,
            color: Colors.black,
          ),
          Card(
            color: Colors.yellow[100],
            elevation: 10.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  ' Searched text from the provider',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Divider(
            height: 30.0,
            thickness: 5.0,
            indent: 30.0,
            endIndent: 30.0,
            color: Colors.purple,
          ),
          Card(
            color: Colors.grey[200],
            elevation: 10.0,
            child: Form(
              key: _searchedAddressFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StandardFormTextField(
                    controller: _searchedAddressController,
                    icon: CarbonIcons.search,
                    obsecureText: false,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: TextButton(
                        style: const ButtonStyle(),
                        child: const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          _queryDatabase(_searchedAddressController.text)!
                              .then((searchedFuture) {
                            // Here we assign the search result to a provider instance
                            if (searchedFuture!.isNotEmpty == true) {
                              addressResultProvider
                                  .setAddressResult(searchedFuture);
                              Navigator.pushNamed(context, '/addressMapPage');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Search result no data'),
                                ),
                              );
                            }
                          }).onError((error, stackTrace) {
                            //
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error'),
                              ),
                            );
                          }).whenComplete(() => null);
                        }),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 20.0,
            thickness: 2.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  void sellerDetailsMethod(BuildContext context) {
    if (_addressFormKey.currentState!.validate() == true) {
      _addressFormKey.currentState!.save();

      //We persist the details in the DB ..via model class
      ModelsUsers()
          .persistSellerDetails(nameText, addressText, latValue, lngValue)!
          .then((sellerSavedDetailsBool) {
        //
        if (sellerSavedDetailsBool == true) {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.blue[100],
                elevation: 10.0,
                shape: Border.all(
                    color: Colors.green, width: 0.5, style: BorderStyle.solid),
                content: Text(
                  'home-sellerDetailsSaved'.tr().toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          });
        } else {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.blue[100],
                elevation: 10.0,
                shape: Border.all(
                    color: Colors.green, width: 0.5, style: BorderStyle.solid),
                content: Text(
                  'home-sellerDetailsNotSaved'.tr().toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          });
        }
      }).onError((error, stackTrace) {
        //
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue[100],
              elevation: 10.0,
              shape: Border.all(
                  color: Colors.green, width: 0.5, style: BorderStyle.solid),
              content: Text(
                'home-sellerDetailsError'.tr().toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
      }).whenComplete(() => null);
    } else {
      //
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue[100],
            elevation: 10.0,
            shape: Border.all(
                color: Colors.green, width: 0.5, style: BorderStyle.solid),
            content: Text(
              'home-sellerDetailsFillAll'.tr().toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      });
    }
  }

  //When user search on a company from App database
  List<dynamic>? _searchResultFuture;
  Future<List<dynamic>?>? _queryDatabase(String? searchedAddress) async {
    _searchResultFuture =
        await ModelsUsers().getSearchedAddressFuture(searchedAddress);
    return _searchResultFuture!;
  }
}

class LocaleFlags {
  final String? localeCode;
  final String? localeCountry;

  LocaleFlags({this.localeCode, this.localeCountry});

  List<Widget> flagsWidget() {
    return [
      Container(
        constraints: const BoxConstraints(
            minWidth: 70.0, maxWidth: 80.0, minHeight: 30.0, maxHeight: 40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Text(
                'En',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                backgroundImage: const AssetImage('assets/images/usaFlag.webp'),
                onBackgroundImageError: (obj, stackTrace) {},
              ),
            ),
          ],
        ),
      ),
      Container(
        constraints: const BoxConstraints(
            minWidth: 70.0, maxWidth: 80.0, minHeight: 30.0, maxHeight: 40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                'عربي',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/UAEFlag.webp'),
                radius: 30.0,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}

class AdvertiseBox extends StatefulWidget {
  @override
  _AdvertiseBoxState createState() => _AdvertiseBoxState();
}

Widget? _advertiseBoxWidget;

class _AdvertiseBoxState extends State<AdvertiseBox> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAdvertiseImages(),
      initialData: [
        [
          _advertiseBoxWidget = _beforeFutureAdvertiseReturn(),
        ]
      ],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (advertiseImagesSource == null) {
            _advertiseBoxWidget = _beforeFutureAdvertiseReturn();
          } else {
            _advertiseBoxWidget = _afterFutureAdvertiseReturn();
          }
        } else {
          _advertiseBoxWidget = Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              minWidth: 380.0,
              maxWidth: 420.0,
              minHeight: 100.0,
              maxHeight: 120.0,
            ),
            child: Image.asset(
              'assets/images/shop2.jpeg',
              fit: BoxFit.cover,
              scale: 1,
              width: 400.0,
            ),
          );
        }
        return _advertiseBoxWidget!;
      },
    );
  }
}

Uint8List? advertiseImagesSourceFuture, advertiseImagesSource;

Uint8List advertiseImage(Uint8List advertisePickedImages) {
  advertiseImagesSource = advertisePickedImages;
  return advertiseImagesSource!;
}

Future<Uint8List> getAdvertiseImages() async {
  var uri = Uri.parse('unsplash.com/photos/HCvFE5OyRJc');
  http.Response response = await http.get(uri);
  if (response != null) {
    Uint8List advertiseImagesSourceLocal = response.bodyBytes;
    advertiseImage(advertiseImagesSourceLocal);
  } else {
    ByteData bytes = await rootBundle.load('assets/images/shop2.jpeg');
    Uint8List advertiseImagesSourceLocal =
        bytes.buffer.asUint8List(0, bytes.lengthInBytes);
    advertiseImage(advertiseImagesSourceLocal);
  }

  return advertiseImagesSourceFuture!;
}

Widget _beforeFutureAdvertiseReturn() {
  return Center(
    child: CircularProgressIndicator(
      value: null,
      backgroundColor: Colors.blue[200],
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
      strokeWidth: 3.0,
      // semanticsValue: 'Loading ..',
      // semanticsLabel: 'Loading',
    ),
  );
}

Widget _afterFutureAdvertiseReturn() {
  return Container(
    alignment: Alignment.center,
    constraints: const BoxConstraints(
      minWidth: 380.0,
      maxWidth: 420.0,
      minHeight: 100.0,
      maxHeight: 120.0,
    ),
    child: Image.memory(
      advertiseImagesSource!,
      fit: BoxFit.fill,
      alignment: Alignment.center,
      errorBuilder: (ctx, o, n) {
        return Image.asset(
          'assets/images/shop2.jpeg',
          fit: BoxFit.contain,
          scale: 1,
          width: 400.0,
        );
      },
    ),
  );
}
