import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_design/userauthpage.dart';

class HomePage extends StatefulWidget {
  static const String id="HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownvalue="English";

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
          Positioned(
            top: 170,
            left: 60,
            child: Column(
              children: [
                SvgPicture.asset('assets/image.svg',width: 55,height: 55,),
                const SizedBox(height: 40,),
                const Text("Please select your Language",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                const SizedBox(height: 15,),
                const Text("You can change the language",style: TextStyle(fontSize: 15),),
                const Text("at any time.",style: TextStyle(fontSize: 15),),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.only(left: 12,right: 1),
                  height: 45,width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 2),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownvalue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 35,
                    isExpanded: true,
                    style: const TextStyle(color: Colors.black,fontSize:17),
                    underline: Container(height: 0),
                    focusColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    onChanged: (newvalue){
                      setState(() {
                        dropdownvalue=newvalue!;
                      });
                    },
                    items: <String>['English', 'Hindi', 'Kannada']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextButton(onPressed: () { Navigator.pushNamed(context, UserAuthPage.id); },
                child: Container(height: 45,width: 200,color: const Color.fromRGBO(0, 51, 102, 1),child: const Center(child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),)),
              ],
            ),
          ),
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
