import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qcard_app/QPack.dart';
import 'package:qcard_app/model/modelPacks.dart';
import 'package:qcard_app/rest/rest.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<Cadastro> {
  RestImplementation rest = new RestImplementation();
  final _userNomeEmpresaController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _userCelularController = TextEditingController();
  final _userSenhaController = TextEditingController();
  final _userConfirmaSenhaController = TextEditingController();
  MediaQueryData queryData;

  Widget _textFieldCostumer(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(filled: true, labelText: label),
    );
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1, 193, 95, 56),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 30.0),
            _textFieldCostumer(_userNomeEmpresaController, "Nome da Empresa"),
            SizedBox(height: 30.0),
            _textFieldCostumer(_userEmailController, "Email"),
            SizedBox(height: 30.0),
            _textFieldCostumer(_userCelularController, "Celular"),
            SizedBox(height: 30.0),
            _textFieldCostumer(_userSenhaController, "Senha"),
            SizedBox(height: 30.0),
            _textFieldCostumer(_userConfirmaSenhaController, "Confirmar Senha"),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  child: Text("Confirmar"),
                  onPressed: () {
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("Confira se os dados estão corretos"),
                              content: new SingleChildScrollView(
                                child: new ListBody(
                                  children: <Widget>[
                                    new Text("Nome da empresa:",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                                    new Text(_userNomeEmpresaController.text, style: TextStyle(fontSize: 17.0)),
                                    new Text("Email:",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                                    new Text(_userEmailController.text, style: TextStyle(fontSize: 17.0,)),
                                    new Text("Telefone:",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                                    new Text(_userCelularController.text, style: TextStyle(fontSize: 17.0)),
                                    ButtonBar(
                                        RaisedButton(
                                            child: Text("Ok"),
                                            color: Colors.green,
                                            onPressed: (){
                                              rest.getData();
                                            }),
                                        RaisedButton(
                                            child: Text("Cancelar"),
                                            color: Colors.red,
                                            onPressed: (){
                                              Navigator.pop(context);
                                            })
                                    )
                                    ,
                                  ],
                                ),
                              ),
                          );
                        }
                    );
                    Future<List<ModelPacks>> answer = rest.getData();
                    answer.then((result) {
                      print(result);
                      _userNomeEmpresaController.text;
                      _userEmailController.text;
                      if(_userSenhaController.text == _userConfirmaSenhaController.text){
                        _userSenhaController.text;
                      }
                      _userCelularController.text;

                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
