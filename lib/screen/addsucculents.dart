import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:succulentcactus/db/firebasedb.dart';

class AddSucculent extends StatefulWidget {
  @override
  _AddSucculentState createState() => _AddSucculentState();
}

class _AddSucculentState extends State<AddSucculent> {

final img = TextEditingController();
final name = TextEditingController();
final  sname = TextEditingController();
final description = TextEditingController();
final   light= TextEditingController();
final temp= TextEditingController();
final  water= TextEditingController();
final origin= TextEditingController();
final prop= TextEditingController();

final Firebasedb _firebasedb = Firebasedb();

@override
  void dispose() {
   img.dispose();
   name.dispose();
   sname.dispose();
   description.dispose();
   light.dispose();
   temp.dispose();
   water.dispose();
   origin.dispose();
   prop.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal : 60 , vertical:40 ),
          child: Column(children: <Widget>[
            TextField(decoration: InputDecoration(hintText: "Image"), controller: img,),
            TextField(decoration: InputDecoration(hintText: "Name"), controller: name,),
            TextField(decoration: InputDecoration(hintText: "Scientific Name"), controller: sname,),
            TextField(decoration: InputDecoration(hintText: "Description"), controller: description,),
            TextField(decoration: InputDecoration(hintText: "Light"), controller: light,),
            TextField(decoration: InputDecoration(hintText: "Temp"), controller: temp,),
            TextField(decoration: InputDecoration(hintText: "Water"), controller: water,),
            TextField(decoration: InputDecoration(hintText: "Origin"), controller: origin,),
            TextField(decoration: InputDecoration(hintText: "Propergation"), controller: prop,),
            RaisedButton( child: Text("Add"), onPressed: () async => _firebasedb.add(
              img: img.text,
              name: name.text,
              sname: sname.text,
              description: description.text,
              light: light.text,
              temp: temp.text,
              water: water.text,
              origin: origin.text,
              prop: prop.text
              )
              )




          ],),
        )


      )
    );
  }
}