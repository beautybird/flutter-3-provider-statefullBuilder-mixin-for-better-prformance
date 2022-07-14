import 'package:flutter/material.dart';
import 'package:flutter3/src/settings/settings_controller.dart';

class MixinOnePage extends StatefulWidget {
  static const routeName = "/mixinOnePage";
  final SettingsController? controller;

  const MixinOnePage({Key? key, this.controller}) : super(key: key);

  @override
  State<MixinOnePage> createState() => _MixinOnePageState();
}

class _MixinOnePageState extends State<MixinOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mixin With Provider"),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
