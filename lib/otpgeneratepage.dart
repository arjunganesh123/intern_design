import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intern_design/workingpage.dart';
import 'package:pinput/pinput.dart';

class OtpGeneratePage extends StatefulWidget {
  static const String id="OtpGeneratePage";
  final String phno;
  const OtpGeneratePage({Key? key, required this.phno}) : super(key: key);

  @override
  _OtpGeneratePageState createState() => _OtpGeneratePageState();
}

class _OtpGeneratePageState extends State<OtpGeneratePage> {
  late String sms;
  late String _verificationCode;
  static const defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      color: Colors.lightBlueAccent,
    ),
  );
  late String phno;
  @override
  void initState() {
    phno=widget.phno;
    _verifyPhone();
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
            const SizedBox(height: 5.0,),
            Text("code is sent to $phno",style: const TextStyle(fontSize: 15),),
            const SizedBox(height: 10,),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            length: 6,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: false,
            onSubmitted: (pin) async{
              setState(() {
                sms=pin;
              });
              try{
                await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationCode, smsCode: pin)).then((value) async {
                  if(value.user!=null){
                    Navigator.pushNamedAndRemoveUntil(context, WorkingPage.id, (Route<dynamic> route) => false);
                  }
                });
              }
              catch(e){
                setState(() {
                  const SnackBar(
                    content: Text('Enter valid OTP',style: TextStyle(color: Colors.white,fontSize: 15),),
                    backgroundColor: Color.fromRGBO(0, 51, 102, 1),
                  );
                });
              }
            },
          ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  const Text("Didn't receive the code?",style: TextStyle(fontSize: 15),),
                  TextButton(
                      onPressed:(){
                             _verifyPhone();
                      },
                      child: const Text("Request Again",style: TextStyle(color: Colors.blue,fontSize: 15),)),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            TextButton(
                onPressed: () async{
                  try{
                    await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationCode, smsCode: sms)).then((value) async {
                      if(value.user!=null){
                        Navigator.pushNamedAndRemoveUntil(context, WorkingPage.id, (Route<dynamic> route) => false);
                      }
                    });
                  }
                  catch(e){
                    setState(() {
                      const SnackBar(
                        content: Text('Enter valid OTP',style: TextStyle(color: Colors.white,fontSize: 15),),
                        backgroundColor: Color.fromRGBO(0, 51, 102, 1),
                      );
                    });
                  }
                },
                child: Container(height: 50,width: 320,color: const Color.fromRGBO(0, 51, 102, 1),child: const Center(child: Text("VERIFY AND CONTINUE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),)),
          ],
        ),
      ),
    );
  }

  _verifyPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phno}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          try{
            await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
              if(value.user!=null){
                Navigator.pushNamedAndRemoveUntil(context, WorkingPage.id, (Route<dynamic> route) => false);
              }
            });
          }
          catch(e){
            setState(() {
              const SnackBar(
                content: Text('Enter valid OTP',style: TextStyle(color: Colors.white,fontSize: 15),),
                backgroundColor: Color.fromRGBO(0, 51, 102, 1),
              );
            });
          }
    },
        verificationFailed: (FirebaseAuthException e){
        },
        codeSent: (String verificationID,int? resendToken){
          setState(() {
            _verificationCode=verificationID;
          });
        },
        timeout: const Duration(seconds: 30),
        codeAutoRetrievalTimeout: (String verificationId) {  },
    );
  }
}
