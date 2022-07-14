import 'package:flutter/material.dart';

class StandardFormTextField extends StatelessWidget {
  final TextEditingController? controller;

  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final IconData? icon;

  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final String? tooltip;
  final Function()? onPressed;
  RegExp? regExp = new RegExp(r'^[a-zA-Z0-9_]+( [a-zA-Z0-9_]+)*$');
  Iterable<RegExpMatch>? matches;
  final String? Function(String?)? validate;

  final String? formTextFieldLabel;
  final bool? obsecureText;
  final int? maxLines;

  StandardFormTextField({
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.icon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.tooltip,
    this.onPressed,
    this.matches,
    this.formTextFieldLabel,
    this.obsecureText,
    this.maxLines,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: null,
      focusNode: FocusNode(),
      decoration: InputDecoration(
        labelText: formTextFieldLabel,
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontStyle: FontStyle.italic),
        //hintText: 'Type Your Password',
        //hintStyle: TextStyle(color: Colors.black87,fontSize: 16.0),
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
        /*suffixIcon: IconButton(
          icon: Icon(Icons.text_fields),
            iconSize: 35.0,
            color: Colors.black,
            tooltip: tooltip,
            alignment: Alignment.centerRight,
            onPressed: onPressed,
          ),*/
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orangeAccent,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: TextStyle(color: Colors.black),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.none,
      textInputAction: textInputAction,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
        fontStyle: FontStyle.italic,
      ),
      strutStyle: StrutStyle(),
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: true,
      enableSuggestions: true,
      obscureText: obsecureText!,
      maxLines: maxLines,
      validator: validate,
      /*(val)=> !val.contains(pattern) ||  val.isEmpty? 'Invalid Charachters': null,*/
      //onSaved: (val)=> _text = val ,
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      autofocus: false,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
    );
  }
}
/*
class Form_Text_Field_Standard extends StatelessWidget {
  String? tf_label;
  TextEditingController? fieldController;
  IconData? icon;

  Pattern? pattern = '^[a-zA-Z0-9_]+( [a-zA-Z0-9_]+)*\$';
  Function()? onTap;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  Function()? onEditingComplete;
  String? tooltip;
  Function()? onPressed;
  RegExp? regExp = new RegExp(r'^[a-zA-Z0-9_]+( [a-zA-Z0-9_]+)*$');
  Iterable<RegExpMatch>? matches;

  Form_Text_Field_Standard(
      {this.tf_label,
      this.fieldController,
      this.icon,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.tooltip,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 100,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: true,
      enableSuggestions: true,
      //obscureText: true,
      controller: fieldController,
      autovalidate: false,
      //validator: (val)=> !val.contains(pattern) ||  val.isEmpty? 'Invalid Charachters': null,
      //onSaved: (val)=> _text = val ,
      decoration: InputDecoration(
        labelText: tf_label,
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontStyle: FontStyle.italic),
        //hintText: 'Type Your Password',
        //hintStyle: TextStyle(color: Colors.black87,fontSize: 16.0),
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
        */ /*suffixIcon: IconButton(
          icon: Icon(Icons.text_fields),
            iconSize: 35.0,
            color: Colors.black,
            tooltip: tooltip,
            alignment: Alignment.centerRight,
            onPressed: onPressed,
          ),*/ /*
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: TextStyle(color: Colors.black),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      autofocus: true,
      onChanged: onChanged!,
      onEditingComplete: onEditingComplete!,
      onFieldSubmitted: onFieldSubmitted!,
      onTap: onTap!,
    );
  }
}*/

class Form_Text_Field_Text extends StatelessWidget {
  String? tf_label;
  TextEditingController? fieldController;
  IconData? icon;

  String? _text;
  Pattern? pattern =
      '^([A-HK-PRSVWY][A-HJ-PR-Y])\s?([0][2-9]|[1-9][0-9])\s?[A-HJ-PR-Z]{3}\$';
  Function()? onTap;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  Function()? onEditingComplete;
  Function()? onPressed;
  String? tooltip;

  Form_Text_Field_Text(
      {this.tf_label,
      this.fieldController,
      this.icon,
      this.tooltip,
      this.onChanged,
      this.onFieldSubmitted,
      this.onTap,
      this.onEditingComplete,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 100,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: true,
      enableSuggestions: true,
      //obscureText: true,
      controller: fieldController,
      //validator: (val)=> !val.contains(pattern)  || val.isEmpty? 'Invalid Charachters': null,
      //onSaved: (val)=> _text = val ,
      decoration: InputDecoration(
        labelText: tf_label,
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontStyle: FontStyle.italic),
        //hintText: 'Type Your Password',
        //hintStyle: TextStyle(color: Colors.black87,fontSize: 16.0),
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          iconSize: 35.0,
          color: Colors.black,
          tooltip: tooltip,
          alignment: Alignment.centerRight,
          onPressed: onPressed,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: TextStyle(color: Colors.black),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      validator: (stringFieldValue) =>
          stringFieldValue!.isEmpty == true ? 'Fill The Details' : null,
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      autofocus: false,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
    );
  }
}

class Form_Text_Field_Email extends StatelessWidget {
  String? tf_label;
  TextEditingController? fieldController;
  IconData? icon;

  String? _email;
  Function()? onTap;
  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  Function()? onEditingComplete;

  Form_Text_Field_Email(
      {this.tf_label,
      this.fieldController,
      this.icon,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 100,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: true,
      enableSuggestions: true,
      //obscureText: true,
      controller: fieldController,
      validator: (val) =>
          !val!.contains('@') || !val.contains('.') || val.isEmpty
              ? 'Invalid Email Address'
              : null,
      //validator: (val)=> val.contains('^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}\$') || val.contains('^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$') ||
      //  val.contains('^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)\$')|| val.isEmpty? 'Invalid Email': null,
      onSaved: (val) => _email = val,
      decoration: InputDecoration(
        labelText: tf_label,
        labelStyle: TextStyle(color: Colors.black87, fontSize: 16.0),
        //hintText: 'Type Your Password',
        //hintStyle: TextStyle(color: Colors.black87,fontSize: 16.0),
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: TextStyle(color: Colors.black),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      autofocus: true,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
    );
  }
}

/*

class Form_Text_Field_Password extends StatelessWidget {
  String tf_label;
  TextEditingController fieldController;
  IconData icon;

  String _password;

  Form_Text_Field_Password({this.tf_label, this.fieldController, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 100,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: true,
      enableSuggestions: true,
      obscureText: true,
      controller: fieldController,
      autovalidate: false,
      validator: (val) => val.length < 6 || val.length > 12 || val.isEmpty
          ? 'Password Between 6 to 12 Charachters'
          : null,
      onSaved: (val) => _password = val,
      decoration: InputDecoration(
        labelText: tf_label,
        labelStyle: TextStyle(color: Colors.black87, fontSize: 16.0),
        //hintText: 'Type Your Password',
        //hintStyle: TextStyle(color: Colors.black87,fontSize: 16.0),
        prefixIcon: Icon(
          icon,
          color: Colors.blueAccent,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      toolbarOptions: ToolbarOptions(
          copy: false, cut: true, paste: false, selectAll: false),
      autofocus: true,
    );
  }
}
*/
/*

class Form_Text_Field_Number_Zipcode extends StatelessWidget {
  String tf_label;
  TextEditingController fieldController;
  IconData icon;

  String _number;
  Pattern pattern = '^[0-9]*\$';

  Form_Text_Field_Number_Zipcode(
      {this.tf_label, this.fieldController, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 100,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: true,
      enableSuggestions: true,
      controller: fieldController,
      autovalidate: false,
      //validator: (val)=> !val.contains(pattern,0) || val.isEmpty ? 'Only Numbers':null ,
      //onSaved: (val)=> _number = val,

      decoration: InputDecoration(
        labelText: tf_label,
        labelStyle: TextStyle(color: Colors.black87, fontSize: 16.0),
        //hintText: 'Type Your Password',
        //hintStyle: TextStyle(color: Colors.black87,fontSize: 16.0),
        prefixIcon: Icon(
          icon,
          color: Colors.blueAccent,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      autofocus: true,
    );
  }
}
*/
/*

class Form_Text_Field_Number extends StatelessWidget {
  String tf_label;
  TextEditingController fieldController;
  IconData icon;

  String _number;
  Pattern pattern =
      '(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}\$|[0-9\-\s]{10}\$)';

  //Pattern pattern = '(^\+[0-9]{2}|^00[0-9]{2}|^0)([0-9]{9}\$|[0-9\-\s]{10}\$)';
  Form_Text_Field_Number({this.tf_label, this.fieldController, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 150,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: true,
      enableSuggestions: true,
      controller: fieldController,
      autovalidate: false,
      //validator: (val)=> !val.contains(pattern,0) || val.isEmpty ? '+3123525667788999':null ,
      //onSaved: (val)=> _number = val,

      decoration: InputDecoration(
        labelText: tf_label,
        labelStyle: TextStyle(color: Colors.black87, fontSize: 16.0),
        //hintText: 'Type Your Password',
        //hintStyle: TextStyle(color: Colors.black87,fontSize: 16.0),
        prefixIcon: Icon(
          icon,
          color: Colors.blueAccent,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: false),
      autofocus: true,
    );
  }
}
*/
/*

class Form_Text_Field_LongText extends StatelessWidget {
  String tf_label;
  TextEditingController fieldController;
  IconData icon;

  String _text;
  Pattern pattern =
      '^([A-HK-PRSVWY][A-HJ-PR-Y])\s?([0][2-9]|[1-9][0-9])\s?[A-HJ-PR-Z]{3}\$';
  Function onTap;
  Function onChanged;
  Function onFieldSubmitted;
  Function onEditingComplete;
  Function onPressed;
  String tooltip;

  Form_Text_Field_LongText(
      {this.tf_label,
      this.fieldController,
      this.icon,
      this.tooltip,
      this.onChanged,
      this.onFieldSubmitted,
      this.onTap,
      this.onEditingComplete,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 100,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      autocorrect: true,
      enableSuggestions: true,
      //obscureText: true,
      controller: fieldController,
      autovalidate: false,
      //validator: (val)=> !val.contains(pattern) || val.contains('^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}]$') || val.contains('^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$') ||
      //  val.contains('^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)\$')||
      // val.contains('(https?:\/\/)?(www\.)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)|(https?:\/\/)?(www\.)?(?!ww)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)')||val.isEmpty? 'Invalid Charachters': null,
      //onSaved: (val)=> _text = val ,
      decoration: InputDecoration(
        labelText: tf_label,
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontStyle: FontStyle.italic),
        //hintText: 'Type Your Password',
        //hintStyle: TextStyle(color: Colors.black87,fontSize: 16.0),
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
        */
/* suffixIcon: IconButton(
          icon: Icon(Icons.search),
          iconSize: 35.0,
          color: Colors.black,
          tooltip: tooltip,
          alignment: Alignment.centerRight,
          onPressed: onPressed,
        ),*/ /*

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gapPadding: 4.0,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorStyle: TextStyle(color: Colors.black),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
      ),
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      autofocus: true,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
    );
  }
}
*/
