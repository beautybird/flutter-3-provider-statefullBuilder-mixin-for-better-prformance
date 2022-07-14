import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListViewHome extends StatelessWidget {
  final Key? key;
  final Axis? scroll;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final int? semanticChildes;
  final String? restorationId;
  final Clip? clipBehaviour;

  ListViewHome(
      {this.key,
      this.scroll,
      this.physics,
      this.shrinkWrap,
      this.padding,
      this.semanticChildes,
      this.restorationId,
      this.clipBehaviour});

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: key,
      scrollDirection: scroll!,
      controller: ScrollController(
        initialScrollOffset: 0,
        keepScrollOffset: true,
        debugLabel: 'listViewStandard',
      ),
      primary: false,
      physics: physics,
      shrinkWrap: shrinkWrap!,
      padding: padding,
      itemExtent: 0.0,
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      addSemanticIndexes: true,
      cacheExtent: 0.0,
      semanticChildCount: semanticChildes,
      dragStartBehavior: DragStartBehavior.start,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
      restorationId: restorationId,
      clipBehavior: clipBehaviour!,
      children: <Widget>[],
    );
  }
}

class ListViewBuilder extends StatefulWidget {
  //const ListViewBuilder({Key? key}) : super(key: key);
  final Axis? scrollDirection;
  final double? verticalPadding;
  final double? horizontalPadding;
  final int? listItemsCount;
  final Widget? child;

  ListViewBuilder({
    this.scrollDirection,
    this.verticalPadding,
    this.horizontalPadding,
    this.listItemsCount,
    this.child,
  });

  @override
  _ListViewBuilderState createState() => _ListViewBuilderState(scrollDirection,
      verticalPadding, horizontalPadding, listItemsCount, child);
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  final Axis? scrollDirection;
  final double? verticalPadding;
  final double? horizontalPadding;
  final int? listItemsCount;
  final Widget? child;

  _ListViewBuilderState(this.scrollDirection, this.verticalPadding,
      this.horizontalPadding, this.listItemsCount, this.child);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: scrollDirection!,
        reverse: false,
        controller: ScrollController(),
        primary: false,
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding!,
          horizontal: horizontalPadding!,
        ),
        itemCount: listItemsCount,
        semanticChildCount: 0,
        dragStartBehavior: DragStartBehavior.start,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        clipBehavior: Clip.hardEdge,
        itemBuilder: (BuildContext context, int index) {
          return child!;
        });
  }
}
