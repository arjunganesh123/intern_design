import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_design/finishpage.dart';

class WorkingPage extends StatefulWidget {
  const WorkingPage({Key? key}) : super(key: key);
  static const String id='WorkingPage';
  @override
  _WorkingPageState createState() => _WorkingPageState();
}

class _WorkingPageState extends State<WorkingPage> {
  int x=0xFFFFFFFF;
  int y=0xFFFFFFFF;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Column(
          children: [
            const Text("Please select your profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            const SizedBox(height: 25.0,),
            MaterialButton(
              onPressed: (){
                setState(() {
                  x=0xFF191970;
                  y=0xFFFFFFFF;
                });
              },
              child: Container(
                height: 100,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 1.5),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        x=0xFF191970;
                        y=0xFFFFFFFF;
                      },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            primary: Colors.white,
                            shape: const CircleBorder(
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        child:CircleAvatar(radius: 9.0,backgroundColor: Color(x),),),
                    SvgPicture.asset("assets/warehouse.svg",width: 55,height: 55,),
                    const SizedBox(width: 5.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Shipper',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,letterSpacing: 1.0),),
                        SizedBox(height: 5.0,),
                        Text('Lorem ipsum dolor sit amet,\n consectetur adipiscing'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25.0,),
            MaterialButton(
              onPressed: (){
                setState(() {
                  y=0xFF191970;
                  x=0xFFFFFFFF;
                });
              },
              child: Container(
                height: 100,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 1.5),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          y=0xFF191970;
                          x=0xFFFFFFFF;
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                          shape: const CircleBorder(
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        child:CircleAvatar(radius: 9.0,backgroundColor: Color(y),)),
                    SvgPicture.asset("assets/shipped.svg",width: 55,height: 55,),
                    const SizedBox(width: 8.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Transporter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,letterSpacing: 1.0),),
                        SizedBox(height: 5.0,),
                        Text('Lorem ipsum dolor sit amet,\n consectetur adipiscing'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25.0,),
            TextButton(
                onPressed: () {
                     Navigator.pushNamed(context, FinishPage.id);
                },
                child: Container(height: 50,width: 320,color: const Color.fromRGBO(0, 51, 102, 1),child: const Center(child: Text("CONTINUE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),)),
          ],
        ),
      ),
    );
  }
}
