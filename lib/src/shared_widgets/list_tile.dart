import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileStandard extends StatelessWidget {
  Widget? leading;
  Widget? title;
  Widget? subtitle;
  Widget? trailing;
  bool? isThreeLine;
  Function()? onTap;
  Function()? onLongPresed;

  ListTileStandard(
      {this.leading,
      this.title,
      this.subtitle,
      this.trailing,
      this.isThreeLine,
      this.onTap,
      this.onLongPresed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      isThreeLine: isThreeLine!,
      dense: true,
      visualDensity: VisualDensity.comfortable,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      contentPadding: EdgeInsets.all(1.0),
      enabled: true,
      mouseCursor: MouseCursor.defer,
      selected: false,
      focusColor: Colors.white,
      hoverColor: Colors.grey,
      focusNode: FocusNode(),
      autofocus: false,
      tileColor: Colors.white,
      selectedTileColor: Colors.yellow,
      horizontalTitleGap: 1.0,
      minVerticalPadding: 1.0,
      minLeadingWidth: 1.0,
      onTap: onTap,
      onLongPress: onLongPresed,
    );
  }
}
