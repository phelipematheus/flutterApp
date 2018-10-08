import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qcard_app/model/modelPacks.dart';

class RestImplementation {
  http.Client client = new http.Client();
  JsonCodec json = new JsonCodec();
  Utf8Codec utf8 = new Utf8Codec();

  Future<List<ModelPacks>> createUserList(List data) async {
    List<ModelPacks> list = new List();

    for (int i = 0; i < data.length; i++) {
      String title = data[i]["login"];
      int id = data[i]["id"];
      ModelPacks movie = new ModelPacks(name: title, id: id);
      list.add(movie);
    }
    return list;
  }

  Future<List<ModelPacks>> getData() async {
    final response = await http.get('https://api.github.com/users');
    print(response.toString());
    List responseJson = json.decode(response.body.toString());
    Future<List<ModelPacks>> userList = createUserList(responseJson);
    return userList;
  }
}
