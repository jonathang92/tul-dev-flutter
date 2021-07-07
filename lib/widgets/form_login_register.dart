import 'package:flutter/material.dart';

class FormLoginRegister extends StatefulWidget {
  final Function action;

  const FormLoginRegister({@required this.action});
  @override
  _FormLoginRegisterState createState() => _FormLoginRegisterState();
}

class _FormLoginRegisterState extends State<FormLoginRegister> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff52b9a5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                    ),
                  ),
                  child: Text('Login'),
                  onPressed: () {
                    this.widget.action(
                        mail: mailController.text,
                        password: passwordController.text);
                  },
                )),
          ],
        ));
  }
}
