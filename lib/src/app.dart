import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter3/src/map/address_map.dart';
import 'package:flutter3/src/map/map_provider/map_provider.dart';
import 'package:flutter3/src/providers/search_address.dart';
import 'package:flutter3/src/providers/stateful_provider.dart';
import 'package:flutter3/src/routes/home.dart';
import 'package:flutter3/src/routes/login.dart';
import 'package:flutter3/src/routes/map_provider.dart';
import 'package:flutter3/src/routes/stateful_bulder.dart';
import 'package:flutter3/src/routes/using_mixin.dart';
import 'package:flutter3/src/settings/settings_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<MapProvider>(
              create: (context) => MapProvider(),
            ),
            ChangeNotifierProvider<SearchAddressProvider>(
              create: (context) => SearchAddressProvider(),
            ),
            ChangeNotifierProvider<StatefulProvider>(
              create: (context) => StatefulProvider(),
            ),
          ],
          child: MaterialApp(
            builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 1200,
              minWidth: 400.0,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(
                color: const Color(0xFFF5F5F5),
              ),
            ),
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',
            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            /*onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,*/
            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            initialRoute: '/homePageRoute',
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case Home.routeName:
                      return Home(controller: settingsController);
                    case LoginView.routeName:
                      return Login(controller: settingsController);
                    case AddressMap.routeName:
                      return AddressMap(controller: settingsController);
                    case SampleItemListView.routeName:
                    case StatefulWidgetPage.routeName:
                      return StatefulWidgetPage(
                        controller: settingsController,
                      );
                    case MapProviderPage.routeName:
                      return MapProviderPage(
                        controller: settingsController,
                      );
                    case UsingMixinPage.routeName:
                      return UsingMixinPage(
                        controller: settingsController,
                      );
                    default:
                      return const SampleItemListView();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
