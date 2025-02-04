import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:succulentcactus/assets/colors.dart';
import 'package:succulentcactus/model/succulent.dart';

class DetailPage extends StatelessWidget {
  final Succulent succulent;
  DetailPage({this.succulent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 350,
              child: Stack(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: CachedNetworkImage(
                        imageUrl: succulent.img,
                        fit: BoxFit.cover,
                      )),
                  //       Container(
                  //   decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //      begin: FractionalOffset.bottomCenter,
                  //     end: FractionalOffset.topCenter,
                  //     colors: [
                  //       Colors.black.withOpacity(0.0),
                  //       Colors.black,
                  //     ],
                  //   )),
                  //   height: 200,
                  // ),
                  Positioned(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 250,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: Offset(0, 0))
                      ], color: banner, borderRadius: BorderRadius.circular(3)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            this.succulent.name ?? '',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            this.succulent.sname ?? '',
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 18, color: Colors.white70),
                          ),
                        ],
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width - 40,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Introduction',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text(
                              this.succulent.description,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Details',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            detailCard(
                                info: "Water",
                                data: succulent.water,
                                icon: 'images/drop.svg'),
                            detailCard(
                                info: "Light",
                                data: succulent.light,
                                icon: 'images/sunny.svg'),
                            detailCard(
                                info: "Temprature",
                                data: succulent.temp,
                                icon: 'images/cold.svg'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'References',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
                            child: ListTile(
                          title: Text("Wikipeida Page"),
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailCard({String info, String data, String icon}) {
    return Card(
      child: Container(
        height: 100,
        width: 200,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  info,
                  style: TextStyle(fontSize: 18),
                ),
                SvgPicture.asset(
                  icon,
                  width: 30,
                  height: 30,
                  allowDrawingOutsideViewBox: true,
                ),
              ],
            ),
            Text(
              data,
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
