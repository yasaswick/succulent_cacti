import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:succulentcactus/model/succulent.dart';

class SucculentList extends StatefulWidget {
  @override
  _SucculentListState createState() => _SucculentListState();
}

class _SucculentListState extends State<SucculentList> {
  @override
  Widget build(BuildContext context) {
    final succulents = Provider.of<List<Succulent>>(context) ?? [];
    print(succulents.length);
    return ListView.builder(
      itemCount: succulents.length,
      itemBuilder: (_,index){
        return ListTile(
          title: Text(succulents[index].name),
        );
      },      
    );
  }
}