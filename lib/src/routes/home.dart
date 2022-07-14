import 'package:carbon_icons/carbon_icons.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter3/src/routes/drawer.dart';
import 'package:flutter3/src/routes/map_provider.dart';
import 'package:flutter3/src/routes/stateful_bulder.dart';
import 'package:flutter3/src/routes/using_mixin.dart';
import 'package:flutter3/src/settings/settings_controller.dart';
import 'package:flutter3/src/shared_widgets/clay.dart';

class Home extends StatefulWidget {
  static const routeName = '/homePageRoute';

  //et Locale Value
  static String? selectedLocaleCode;

  SettingsController? controller;

  Home({Key? key, this.controller}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color baseColor = const Color(0xFFF2F2F2);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: ClayContainerDesign(
          containerColor: baseColor,
          borderRadius: 10.0,
          customBorderRadius: BorderRadius.circular(20.0),
          curveType: CurveType.concave,
          height: 70.0,
          textDetails: 'home'.tr().toString(),
          clayTextSize: 27.0,
          clayTextColor: Colors.black,
          clayTextColorText: Colors.grey,
        ),
        centerTitle: true,
        backgroundColor: baseColor,
        toolbarOpacity: 0.5,
        actions: [
          IconButton(
            iconSize: 30.0,
            color: Colors.black,
            disabledColor: Colors.grey,
            splashColor: Colors.yellow,
            //iconConstraints: BoxConstraints(maxWidth: 30.0,maxHeight: 30.0,),
            autofocus: false,
            icon: const Icon(
              CarbonIcons.settings,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          maxWidth: double.infinity,
          minHeight: double.infinity,
          maxHeight: double.infinity,
        ),
        color: Colors.grey[200],
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, MapProviderPage.routeName),
              child: const Text(
                'Google Map With Provider',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              height: 20.0,
              thickness: 2.0,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, StatefulWidgetPage.routeName),
              child: const Text(
                'Stateful Builder With Provider',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              height: 20.0,
              thickness: 2.0,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, UsingMixinPage.routeName),
              child: const Text(
                'Mixin With Provider',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              height: 20.0,
              thickness: 2.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
