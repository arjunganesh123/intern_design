import 'package:flutter/material.dart';

class FinishPage extends StatelessWidget {
  static const String id='FinishPage';
  const FinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: MediaQuery.of(context).size.height*0.17,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromRGBO(47, 174, 229, 0.7),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: CustomClipPath1(),
              child: Container(
                height: MediaQuery.of(context).size.height*0.17,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            ),
          ),
          const Center(child: Text("Thank You",style: TextStyle(color: Colors.black,letterSpacing: 1.5,fontSize: 30.0,wordSpacing: 3.0,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}


class CustomClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.25);
    path.quadraticBezierTo(size.width*0.27,size.height, size.width*0.53, size.height*0.4);
    path.quadraticBezierTo(size.width*0.77, 0, size.width, size.height*0.35);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.3);
    path.quadraticBezierTo(size.width*0.3,0, size.width*0.53, size.height*0.4);
    path.quadraticBezierTo(size.width*0.82, size.height, size.width, size.height*0.35);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
