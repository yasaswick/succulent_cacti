import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:succulentcactus/assets/colors.dart';
import 'package:succulentcactus/db/firebasedb.dart';
import 'package:succulentcactus/model/succulent.dart';
import 'package:succulentcactus/screen/addsucculents.dart';
import 'package:succulentcactus/widgets/succulent_grid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Firebasedb _firebasedb = Firebasedb();
  int currentindex;

  @override
  void initState() {
    currentindex = 0;
    super.initState();
  }

 void changePage(int index){
   setState(() {
     currentindex = index;
   });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Succulent>>.value(
          value: _firebasedb.succulentList(),
          child: Scaffold(
            backgroundColor: background,
        body: Container(
        
         margin: MediaQuery.of(context).padding,
         height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            Container(

            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              SvgPicture.asset('images/plant.svg' , height: 40, width: 40, allowDrawingOutsideViewBox: true,),
              Text("SUCCULENT BOOK" , style: TextStyle( fontSize: 18 ,fontWeight: FontWeight.bold),),
              Icon(Icons.more_horiz , color: Colors.black, size: 30,)
            ],),
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              child: SucculentGrid(),
              ),
            )
            


          ],)
        )
        ,
       //floatingActionButton: FloatingActionButton( child: Icon(Icons.add), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => AddSucculent())) )

      ),
    );
  }
}