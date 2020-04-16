import 'package:cloud_firestore/cloud_firestore.dart';


class Succulent {

    String key;
    String img;
    String name;
    String sname;
    String description;
    String light;
    String temp;
    String water;
    String origin;
    String prop;
    
    Succulent({this.key ,this.img, this.name , this.sname , this.description , this.light , this.temp ,this.water ,this.origin, this.prop});

    factory Succulent.fromFirestoreDocumentSnapshot(DocumentSnapshot data){
      return Succulent(
        key: data.documentID,
        img: data['img'] ?? 'null',
        name: data['name'] ?? 'null',
        sname: data['sname'] ?? 'null',
        description: data['description'] ?? 'null',
        light: data['light'] ?? 'null',
        temp: data['temp'] ?? 'null',
        water: data['water'] ?? 'null',
        origin: data['origin'] ?? 'null',
        prop: data['prop'] ?? 'null',
      );
    }
    


    
  


}
