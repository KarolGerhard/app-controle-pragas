import 'package:controle_pragas/app/login_page.dart';


import 'package:flutter/material.dart';

class LoginModel extends LoginPage {


  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
