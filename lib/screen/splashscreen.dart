import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _timer().then((status){
      if(status = true){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      } else {

      }

    });
    super.initState();
  }

  Future<bool> _timer() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SvgPicture.asset(
        'images/plant.svg',
        height: 100,
        width: 100,
        allowDrawingOutsideViewBox: true,
      ),
    ));
  }
}
