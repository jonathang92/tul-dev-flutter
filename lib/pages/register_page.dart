import 'package:flutter/material.dart';
import 'package:tul_dev/widgets/form_login_register.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void formAction({String mail, String password}) {
      // print('$mail , $password');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: Color(0xff2a5c57),
        ),
        body: FormLoginRegister(action: formAction));
  }
}
