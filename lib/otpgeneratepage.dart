import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpGeneratePage extends StatefulWidget {
  static const String id="OtpGeneratePage";
  final String phno;
  const OtpGeneratePage({Key? key, required this.phno}) : super(key: key);

  @override
  _OtpGeneratePageState createState() => _OtpGeneratePageState();
}

class _OtpGeneratePageState extends State<OtpGeneratePage> {
  late String phno;
  @override
  void initState() {
    phno=widget.phno;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: IconButton(onPressed: () { Navigator.pop(context); },
        icon: const Icon(Icons.arrow_back,size: 30,),),
      body: Padding(
        padding: const EdgeInsets.only(top: 130,left: 10),
        child: Column(
          children: [
            const Text("Verify Phone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            const SizedBox(height: 15,),
            Text("code is sent to $phno",style: const TextStyle(fontSize: 15),),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  const Text("Didn't receive the code?",style: TextStyle(fontSize: 15),),
                  TextButton(
                      onPressed:(){

                      },
                      child: const Text("Request Again",style: TextStyle(color: Colors.blue,fontSize: 15),)),
                ],
              ),
            ),

            const SizedBox(height: 10,),
            TextButton(
                onPressed: () {
                  print(phno);
                },
                child: Container(height: 50,width: 320,color: const Color.fromRGBO(0, 51, 102, 1),child: const Center(child: Text("VERIFY AND CONTINUE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),)),
          ],
        ),
      ),
    );
  }
}
