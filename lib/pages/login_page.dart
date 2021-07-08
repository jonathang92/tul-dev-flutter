import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tul_dev/widgets/form_login_register.dart';
import 'package:tul_dev/helpers/helpers.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void formAction({String mail, String password}) async {
      // print('$mail , $password');
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: mail, password: password);
        Navigator.pop(context);
        print(userCredential.user.email);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showAlert(context, 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showAlert(context, 'Wrong password provided for that user.');
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Color(0xff2a5c57),
        ),
        body: FormLoginRegister(action: formAction));
  }
}
