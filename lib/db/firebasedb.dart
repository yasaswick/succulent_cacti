
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:succulentcactus/model/succulent.dart';

class Firebasedb{

CollectionReference _collectionReference = Firestore.instance.collection('succulent');

Stream<List<Succulent>> succulentList () {
return _collectionReference.snapshots().map((list) => list.documents.map((doc) => Succulent.fromFirestoreDocumentSnapshot(doc)).toList());

}

Future delete(String key){
 return  _collectionReference.document(key).delete();
}

Future add({String img, String name , String sname , String description , String light , String temp ,String water ,String origin, String prop}){
 return _collectionReference.document().setData({
    'img' : img,
    'name' : name,
    'sname' : sname,
    'description' : description,
    'light' : light,
    'temp' : temp,
    'water' : water,
    'origin' : origin,
    'prop':prop
  });
}



}
