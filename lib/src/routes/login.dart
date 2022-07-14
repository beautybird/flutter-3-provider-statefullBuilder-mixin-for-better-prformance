import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter3/src/settings/settings_controller.dart';
import 'package:flutter3/src/shared_widgets/buttons.dart';
import 'package:flutter3/src/shared_widgets/form_text_field.dart';

class LoginView extends StatelessWidget {
  static const routeName = 'loginRoute';

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key, SettingsController? controller}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();

  /*...Create a controller for every field ...*/
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /*...Make sure the field has value entered ...*/
  String? emailValue;

  String _emailLatestValue() {
    return emailValue = ((_emailController.text).isNotEmpty
        ? _emailController.text
        : '');
  }

  String? passwordValue;

  String _passwordLatestValue() {
    return passwordValue = ((_passwordController.text).isNotEmpty
        ? _passwordController.text
        : '');
  }

  List<String>? languagesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.addListener(() {
      _emailLatestValue();
    });
    _passwordController.addListener(() {
      _passwordLatestValue();
    });
  }

  /* ... Fields Patterns ...*/
  final Pattern emailPattern = "/[\w-\.]+@([\w-]+\.)+[\w-]{2,4}/";

  //final Pattern passwordPattern = '/(?=.*?[#?!@\$%^&*-])/';
  final Pattern passwordPattern =
      '/(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%^&+=])(?=\S+).{8,}/';

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          reverse: false,
          controller: ScrollController(),
          primary: false,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              constraints: BoxConstraints(
                minWidth: 380.0,
                maxWidth: 420.0,
                minHeight: 250.0,
                maxHeight: 300.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('res/flowersonsea.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Form(
              key: _loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  StandardFormTextField(
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    fontColor: Colors.black,
                    icon: Icons.email,
                    tooltip:
                        'emailAddress',
                    obsecureText: false,
                    maxLines: 1,
                    formTextFieldLabel:
                        'Email Address',
                    validate: (stringEmailValue) => stringEmailValue!.isEmpty ==
                            true
                        ? 'Email Address Notificaions'
                        : null,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  StandardFormTextField(
                    controller: _passwordController,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    fontColor: Colors.black,
                    icon: Icons.security,
                    tooltip: 'login password tooltip',
                    obsecureText: true,
                    maxLines: 1,
                    formTextFieldLabel:
                        'login password',
                    validate: (stringPassValue) => stringPassValue!.isEmpty ==
                            true
                        ? 'login password notification'
                        : null,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    constraints:const BoxConstraints(
                      minWidth: 380.0,
                      maxWidth: 420.0,
                      minHeight: 50.0,
                      maxHeight: 50.0,
                    ),
                    child: StandardElevatedButton(
                      style:const ButtonStyle(),
                      autofocus: false,
                      child:const Text(
                        'login page login',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          _loginFormKey.currentState!.save();
                          /*..Now we check the email & password with the DB ,if
                           verified then user can login to his/her account*/
                                                  } else {
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.white,
                                elevation: 10.0,
                                shape: Border.all(
                                  color: Colors.orange,
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                ),
                                content:const Text(
                                 'login page fil all details',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 1.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                            _emailController.clear();
                            _passwordController.clear();
                            Timer(Duration(seconds: 4), () {
                              Navigator.pushNamed(context, '/login');
                            });
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      minWidth: 380.0,
                      maxWidth: 420.0,
                      minHeight: 50.0,
                      maxHeight: 50.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            child:const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/register_form');
                            },
                          ),
                        ),
                        /*Expanded(
                          flex: 1,
                          child: InkWell(
                            child: Text(
                              "${'loginPage-forgotPassword'.tr().toString()}",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/forgot_password');
                            },
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
