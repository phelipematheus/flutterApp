import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qcard_app/QPack.dart';
import 'package:qcard_app/cadastro.dart';
import 'package:qcard_app/model/modelPacks.dart';
import 'package:qcard_app/rest/rest.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  MediaQueryData queryData;

  Widget _imageLogoQCard(double width) {
    return Image(
      height: width / 2.0,
      width: width,
      image: AssetImage('assets/qcard-logo-sem-borda.png'),
    );
  }

  Widget _textFieldCostumer(TextEditingController controller, String label, var color) {
    return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      controller: controller,
      decoration: InputDecoration(filled: true, labelText: label, labelStyle: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var color = theme.textTheme.caption.copyWith(color: Colors.black);
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 30.0),
            Column(
              children: <Widget>[
                _imageLogoQCard(queryData.size.width),
              ],
            ),
            SizedBox(height: 50.0),
            _textFieldCostumer(_userNameController, "E-mail",color),
            SizedBox(height: 12.0),
            _textFieldCostumer(_passwordController, "Senha", color),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Cadastrar"),
                  onPressed: () {
                    _userNameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text("Logar"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QPack()),
                    );
                  },
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.photo_camera),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
