import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tul_dev/widgets/form_login_register.dart';
import 'package:tul_dev/helpers/helpers.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void formAction({String mail, String password}) async {
      // print('$mail , $password');
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail, password: password);
        Navigator.pop(context);
        print(userCredential.user.email);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showAlert(context, 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showAlert(context, 'The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: Color(0xff2a5c57),
        ),
        body: FormLoginRegister(action: formAction));
  }
}
