import 'package:flutter/material.dart';
import 'package:qcard_app/model/modelPacks.dart';

class QPack extends StatefulWidget {
  @override
  _QPackState createState() => _QPackState();
}

class _QPackState extends State<QPack>{
  bool ocorreu = false;
  final List<ModelPacks> items = new List();
//  ModelPacks model0 = new  ModelPacks("00", "Phelipe Matheus", null, "DF", 10);
//  ModelPacks model1 = new  ModelPacks("01", "Luiz Guilherme", null, "DF", 10);
//  ModelPacks model2 = new  ModelPacks("02", "Helber", null, "DF", 10);
//  ModelPacks model3 = new  ModelPacks("03", "Luiz Henrrique", null, "DF", 10);
//  ModelPacks model4 = new  ModelPacks("04", "Phelipe", null, "DF", 10);

  void _adicionar() {
//    items.add(model0);
//    items.add(model1);
//    items.add(model2);
//    items.add(model3);
//    items.add(model4);
    ocorreu = true;
  }
  
  Widget bodyData()=> DataTable(
        columns: <DataColumn>[
          DataColumn(label: Text("Código")),
          DataColumn(label: Text("Apelido")),
          DataColumn(label: Text("Local")),
          DataColumn(label: Text("Edit"))
        ],
        rows: items.map((item)=>DataRow(
          cells: [
//            DataCell(
//              Text(item.codigo, textAlign: TextAlign.left),
//            ),
//            DataCell(
//              Text(item.apelido, textAlign: TextAlign.left),
//            ),
//            DataCell(
//              Text(item.local, textAlign: TextAlign.left),
//            ),DataCell(
//              Icon(Icons.cancel,color: Colors.red),
//              showEditIcon: true
//            ),
          ],
        ),
        ).toList(),
      );

  Widget listData()=>GridView.count(
    crossAxisCount: items.length,
    children: List.generate(items.length, (index){
      List<Center> result = List();
      for(int i = 0;i <items.length;i++){
         result.add(Center(
//          child: Text("Phelipe Palmeira"),
        ));
      }
      return Center(
//        child: Text(items[index].apelido),
      );
    }),
  );


  @override
  Widget build(BuildContext context) {
    if (!ocorreu){
    _adicionar();
    }
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: listData(),
      )
    );
  }

}