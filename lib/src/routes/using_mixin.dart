
import 'package:flutter/material.dart';
import 'package:flutter3/src/settings/settings_controller.dart';

class UsingMixinPage extends StatefulWidget {

  static const routeName="/usingMixinPage";
  final SettingsController? controller;
  const UsingMixinPage({Key? key,this.controller}) : super(key: key);

  @override
  State<UsingMixinPage> createState() => _UsingMixinPageState();
}

class _UsingMixinPageState extends State<UsingMixinPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
