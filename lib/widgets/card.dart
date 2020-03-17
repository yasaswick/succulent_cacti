import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:succulentcactus/model/succulent.dart';
import 'package:succulentcactus/screen/detail_page.dart';


class SucculentCard extends StatelessWidget {

  final Succulent succulent;
  SucculentCard({this.succulent});



  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(succulent: this.succulent,) )),
          child: Column(
            children: <Widget>[
                Container(
                  child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10) , topRight: Radius.circular(10)),
                  child: CachedNetworkImage(imageUrl: succulent.img, width: 200, height:  250 , fit: BoxFit.cover, 
                  placeholder: (context, _ ) => Container( margin : EdgeInsets.all(10) , child: CircularProgressIndicator(backgroundColor: Colors.green,)),)
                  ),
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  Row(children: <Widget>[Text(succulent.name , style: TextStyle(color: Colors.white),)],),
                  Row(children: <Widget>[Text(succulent.sname , style: TextStyle(color:Colors.white),)],),
                ],
                ),
                )
              


          ],),
    );
  }
}
