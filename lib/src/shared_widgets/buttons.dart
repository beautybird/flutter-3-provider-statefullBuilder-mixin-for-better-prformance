import 'package:flutter/material.dart';


class StandardElevatedButton extends StatelessWidget {
  const StandardElevatedButton(
      {this.style, this.autofocus, this.child, this.onPressed});

  final ButtonStyle? style;
  final bool? autofocus;
  final Widget? child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed!,
      onLongPress: () {},
      /*style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(MaterialState.hovered)) {
            return null;
          }
          return null;
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if(states.contains(MaterialState.pressed)){
             return Theme.of(context).colorScheme.secondary.withOpacity(0.5);
          }
          return null;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).colorScheme.primary.withOpacity(0.5);
          }
          return null;
        }),
        shadowColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.focused)) {
            return Theme.of(context).colorScheme.secondaryVariant.withOpacity(0.5);
          }
          return null;
        }),
        elevation: MaterialStateProperty.resolveWith<double>((states) {
          if(states.any((element) {
            return null;
          })){

          }
          return null;
        }),
      ),*/
      focusNode: FocusNode(),
      autofocus: autofocus!,
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}

class UserAccountImageButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? icon;
  //final IconData buttonIcon;
  
  const UserAccountImageButton({this.icon,this.onPressed}) ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: icon );
  }
}

/*class Standard_Raised_Button extends StatelessWidget {
  String buttonText;
  Function onPressed;
  TextStyle style;
  TextDirection textDirection;

  // Create a box shadows effect
  List<BoxShadow> boxShadowsList;

  //Select Language code
  static String language_code;
  Locale locale;

  Standard_Raised_Button(
      {this.buttonText,
      this.onPressed,
      this.style,
      this.textDirection,
      this.boxShadowsList,
      this.locale});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      textTheme: ButtonTextTheme.accent,
      textColor: Colors.black,
      color: Colors.white,
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(4.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.blue, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      autofocus: true,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: style,
        textAlign: TextAlign.center,
      ),
      mouseCursor: SystemMouseCursors.click,
    );
  }
}*/

/*
class Shops_Raised_Button extends StatelessWidget {
  String button_text;
  TextStyle style;
  Function onPressed;
  TextDirection textDirection;

  // Create a box shadows effect
  List<BoxShadow> boxShadowsList;

  //Select Language code
  static String language_code;
  Locale locale;

  Shops_Raised_Button(
      {this.button_text,
      this.style,
      this.onPressed,
      this.textDirection,
      this.locale});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.black,
      color: Colors.yellow[100],
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.blue, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Text(
        button_text,
        textAlign: TextAlign.justify,
        softWrap: true,
        overflow: TextOverflow.visible,
        textDirection: textDirection,
        locale: locale,
        textScaleFactor: 1.0,
        maxLines: 1,
        textWidthBasis: TextWidthBasis.longestLine,
        style: TextStyle(
          //color: Colors.white,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          letterSpacing: 0.0,
          wordSpacing: 0.0,
          textBaseline: TextBaseline.alphabetic,
          */
/*foreground: Paint()
              ..shader = ui.Gradient.linear(
                const Offset(0, 20),
                const Offset(150, 20),
                <Color>[
                  Colors.red,
                  Colors.yellow,
                ],
              ),*//*

          foreground: Paint()
            ..style = PaintingStyle.fill
            ..strokeWidth = 2
            ..color = Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy,
          shadows: Text_Shadow.text_shadow_list,
        ),
      ),
    );
  }
}

class ForgotPassword_RasedButton extends StatelessWidget {
  String button_text;
  TextStyle style;
  Function onPressed;
  TextDirection textDirection;

  // Create a box shadows effect
  List<BoxShadow> boxShadowsList;

  //Select Language code
  static String language_code;
  Locale locale;

  ForgotPassword_RasedButton(
      {this.button_text,
      this.style,
      this.onPressed,
      this.textDirection,
      this.locale});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.black,
      color: Colors.yellow[100],
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.blue, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Text(
        button_text,
        textAlign: TextAlign.justify,
        softWrap: true,
        overflow: TextOverflow.visible,
        textDirection: textDirection,
        locale: locale,
        textScaleFactor: 1.0,
        maxLines: 1,
        textWidthBasis: TextWidthBasis.longestLine,
        style: TextStyle(
          //color: Colors.white,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          letterSpacing: 0.0,
          wordSpacing: 0.0,
          textBaseline: TextBaseline.alphabetic,
          */
/*foreground: Paint()
              ..shader = ui.Gradient.linear(
                const Offset(0, 20),
                const Offset(150, 20),
                <Color>[
                  Colors.red,
                  Colors.yellow,
                ],
              ),*//*

          foreground: Paint()
            ..style = PaintingStyle.fill
            ..strokeWidth = 2
            ..color = Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy,
          shadows: Text_Shadow.text_shadow_list,
        ),
      ),
    );
  }
}

class RegisterForm_RaisedButton extends StatelessWidget {
  String button_text;
  TextStyle style;
  Function onPressed;
  TextDirection textDirection;

  // Create a box shadows effect
  List<BoxShadow> boxShadowsList;

  //Select Language code
  static String language_code;
  Locale locale;

  RegisterForm_RaisedButton(
      {this.button_text,
      this.style,
      this.onPressed,
      this.textDirection,
      this.locale});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.white,
      color: Colors.teal[300],
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.blue, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Text(
        button_text,
        textAlign: TextAlign.justify,
        softWrap: true,
        overflow: TextOverflow.visible,
        textDirection: textDirection,
        locale: locale,
        textScaleFactor: 1.0,
        maxLines: 1,
        textWidthBasis: TextWidthBasis.longestLine,
        style: TextStyle(
          //color: Colors.white,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          letterSpacing: 0.0,
          wordSpacing: 0.0,
          textBaseline: TextBaseline.alphabetic,
          */
/*foreground: Paint()
              ..shader = ui.Gradient.linear(
                const Offset(0, 20),
                const Offset(150, 20),
                <Color>[
                  Colors.red,
                  Colors.yellow,
                ],
              ),*//*

          foreground: Paint()
            ..style = PaintingStyle.fill
            ..strokeWidth = 2
            ..color = Colors.white,
          //decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy,
          shadows: Text_Shadow.text_shadow_list,
        ),
      ),
    );
  }
}

class UserAccountGaleryImageButton extends StatelessWidget {
  Function onPressed;
  IconData icon;

  UserAccountGaleryImageButton({this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.white,
      color: Colors.white,
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 11.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.teal, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Icon(
              icon,
              size: 30.0,
              color: Colors.teal,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Gallery',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonShopMapArea extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  ButtonShopMapArea({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.white,
      color: Colors.white,
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.teal, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: child,
    );
  }
}

class UserAccountCameraImageButton extends StatelessWidget {
  Function onPressed;
  IconData icon;

  UserAccountCameraImageButton({this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.white,
      color: Colors.white,
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.teal, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Icon(
              icon,
              size: 30.0,
              color: Colors.teal,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Camera',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserAccountRemoveImageBeforeSave extends StatelessWidget {
  Function onPressed;
  IconData icon;

  UserAccountRemoveImageBeforeSave({this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.white,
      color: Colors.white,
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.teal, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              size: 30.0,
              color: Colors.teal,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Change/Remove',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                letterSpacing: 2.0,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ShopPromotion_RaisedButton extends StatelessWidget {
  Function onPressed;
  IconData icon;

  ShopPromotion_RaisedButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.white,
      color: Colors.teal[300],
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
            color: Colors.blue, width: 1.0, style: BorderStyle.solid),
      ),
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 20.0,
        color: Colors.black26,
      ),
    );
  }
}

class MapLocation_RaisedButton extends StatelessWidget {
  IconData icon;
  Function onPressed;

  MapLocation_RaisedButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textTheme: ButtonTextTheme.normal,
      textColor: Colors.white,
      color: Colors.white,
      hoverColor: Colors.yellow[100],
      highlightColor: Colors.yellow,
      splashColor: Colors.orangeAccent,
      colorBrightness: Brightness.light,
      elevation: 10.0,
      highlightElevation: 15.0,
      padding: EdgeInsets.all(2.0),
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.orangeAccent,
          width: 0.5,
          style: BorderStyle.solid,
        ),
      ),
      child: Icon(
        icon,
        size: 20.0,
        color: Colors.orange[100],
      ),
      onPressed: onPressed,
    );
  }
}
*/
