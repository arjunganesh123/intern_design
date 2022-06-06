import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAuthPage extends StatefulWidget {
  static String id='UserAuthPage';
  const UserAuthPage({Key? key}) : super(key: key);

  @override
  _UserAuthPageState createState() => _UserAuthPageState();
}

class _UserAuthPageState extends State<UserAuthPage> {
  final _mobctrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: IconButton(onPressed: () { Navigator.pop(context); },
      icon: const Icon(Icons.close,size: 30,),),
      body: Padding(
        padding: const EdgeInsets.only(top: 130,left: 10),
        child: Column(
          children: [
            const Text("Please enter your mobile number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            const SizedBox(height: 15,),
            const Text("You'll receive a 4 digit code",style: TextStyle(fontSize: 15),),
            const Text("to verify next.",style: TextStyle(fontSize: 15),),
            const SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1.5),
              ),
              child: Row(
                children: [
                   SvgPicture.asset('assets/india.svg',width: 10,height: 30,),
                  const Text('\t\t\t\t+91\t\t\t\t-\t\t\t',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: TextField(
                      controller: _mobctrl,
                      keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        maxLength: 10,
                        style: const TextStyle(letterSpacing: 2.5),
                        decoration:const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          counterText: "",
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(color: Colors.black45,fontSize: 15),
                        ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(
                onPressed: () {
                  if(_mobctrl.text.length<10){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Enter a Valid Mobile Number',style: TextStyle(color: Colors.white,fontSize: 15),),
                          backgroundColor: Color.fromRGBO(0, 51, 102, 1),
                      ),
                    );
                  }
                  else{
                    print(_mobctrl.text);
                  }
             },
                child: Container(height: 50,width: 320,color: const Color.fromRGBO(0, 51, 102, 1),child: const Center(child: Text("CONTINUE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),)),
          ],
        ),
      ),
    );
  }
}
