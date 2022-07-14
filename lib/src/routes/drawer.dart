import 'package:clay_containers/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter3/src/shared_widgets/clay.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Color baseColor =const Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        reverse: false,
        controller: ScrollController(),
        primary: false,
        physics:const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        padding:const EdgeInsets.all(10.0),
        children: [
          SizedBox(
            height: 600.0,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              fit: StackFit.loose,
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  left: 20.0,
                  top: 80.0,
                  width: 250.0,
                  height: 70.0,
                  child: ClayContainerDesign(
                    containerColor: baseColor,
                    borderRadius: 10,
                    customBorderRadius: BorderRadius.circular(20),
                    curveType: CurveType.concave,
                    height: 70.0,
                    textDetails: 'drawer'.tr().toString(),
                    clayTextSize: 32.0,
                    clayTextColor: Colors.white,
                    clayTextColorText: Colors.grey,
                  ),
                ),
                Positioned(
                  left: 5.0,
                  top: 160.0,
                  width: 280.0,
                  height: 60.0,
                  child: DrawerDesign(
                    icon: Icons.account_circle,
                    detail: 'drawer_login'.tr().toString(),
                    onTap:() {
                      setState(() {
                        Navigator.pushNamed(context, '/loginPage');
                      });
                    }
                  ),
                ),
                Positioned(
                  left: 10.0,
                  top: 250.0,
                  width: 280.0,
                  height: 60.0,
                  child: DrawerDesign(
                    icon: Icons.settings,
                    detail: 'drawer_settings'.tr().toString(),
                      onTap:() {
                        setState(() {
                          Navigator.pushNamed(context, '/settings');
                        });
                      }

                  ),
                ),
                Positioned(
                  left: 10.0,
                  top: 340.0,
                  width: 280.0,
                  height: 60.0,
                  child: DrawerDesign(
                    icon: Icons.share,
                    detail: 'drawer_shareApp'.tr().toString(),
                      onTap:() {
                        setState(() {
                          Navigator.pushNamed(context, '/shareappPage');
                        });
                      }
                  ),
                ),
                Positioned(
                  left: 10.0,
                  top: 430.0,
                  width: 280.0,
                  height: 60.0,
                  child: DrawerDesign(
                    icon: Icons.email,
                    detail: 'drawer_contactUs'.tr().toString(),
                      onTap:() {
                        setState(() {
                          Navigator.pushNamed(context, '/contactusPage');
                        });
                      }
                  ),
                ),
                Positioned(
                  left: 10.0,
                  top: 520.0,
                  width: 280.0,
                  height: 60.0,
                  child: DrawerDesign(
                    icon: Icons.description,
                    detail: 'drawer_about'.tr().toString(),
                      onTap:() {
                        setState(() {
                          Navigator.pushNamed(context, '/aboutPage');
                        });
                      }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerDesign extends StatelessWidget {
  final IconData? icon;
  final String? detail;
  final Function()? onTap;
  final Color? baseColor = const Color(0xFFF2F2F2);
  DrawerDesign({this.icon, this.detail, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20.0,
        color: Colors.black,
      ),
      title: Card(
        color:baseColor,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side:const BorderSide(
            color: Colors.greenAccent,
            style: BorderStyle.solid,
          ),
        ),
        borderOnForeground: true,
        child: ClayContainerDesign(
          containerColor: baseColor,
          borderRadius: 10.0,
          customBorderRadius: BorderRadius.circular(20.0),
          height: 80.0,
          textDetails: detail!,
          clayTextSize: 17.0,
          clayTextColor: Colors.white,
          clayTextColorText: Colors.black,
        ),
      ),
      onTap: onTap,
      dense: false,
    );
  }
}
