import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:succulentcactus/assets/colors.dart';
import 'package:succulentcactus/model/succulent.dart';
import 'package:succulentcactus/screen/detail_page.dart';

class SucculentCard extends StatelessWidget {
  final Succulent succulent;
  SucculentCard({this.succulent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    succulent: this.succulent,
                  ))),
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: CachedNetworkImage(
                        imageUrl: succulent.img,
                        width: 200,
                        height: 230,
                        fit: BoxFit.cover,
                        placeholder: (context, _) => Container(
                            margin: EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
                            )),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black,
                    ],
                    //stops: [0.0,0.65]
                  )),
                  width: 200,
                  height: 230,
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            succulent.name,
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                                                      child: Text(
                              succulent.sname,
                              overflow: TextOverflow.ellipsis,
                          
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
