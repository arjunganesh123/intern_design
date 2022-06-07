import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_design/finishpage.dart';
import 'package:intern_design/homepage.dart';
import 'package:intern_design/userauthpage.dart';
import 'package:intern_design/workingpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const UserAuthPage(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        UserAuthPage.id:(context)=>const UserAuthPage(),
        WorkingPage.id:(context)=>const WorkingPage(),
        FinishPage.id:(context)=>const FinishPage(),
      },
    );
  }
}
