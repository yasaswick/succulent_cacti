import 'package:flutter/material.dart';
import 'package:succulentcactus/model/succulent.dart';
import 'package:provider/provider.dart';
import 'package:succulentcactus/widgets/card.dart';


class SucculentGrid extends StatefulWidget {
  @override
  _SucculentGridState createState() => _SucculentGridState();
}

class _SucculentGridState extends State<SucculentGrid> {
  @override
  Widget build(BuildContext context) {
    final succulents = Provider.of<List<Succulent>>(context) ?? [];
    return GridView.builder(
      padding: EdgeInsets.only(top:5),
      itemCount: succulents.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: .5,
        crossAxisCount: 2), 
      itemBuilder: (_,index){
        return SucculentCard(succulent: succulents[index],);
      });
  }
}