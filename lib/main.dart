import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

///ไฟล์เบสที่เอาไว้เชื่อมต่อ
import 'firebase_options.dart';

///ไฟล์เบสที่เอาไว้เชื่อมต่อ

import 'screen/home_screen.dart';
//import 'screen/sign_up_screen.dart';

bool show = true; //ประกาศเป็นตัวแปรโชว์

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    ///เตรียมไฟล์เบสให้เรียบร้อยเพื่อรอคำสั่งถัดไป

    options: DefaultFirebaseOptions.currentPlatform,

    ///ถ้าใช้idไหนให้ใส่อันนั้น เช่นiosใช้idของiosที่ให้มา
  );

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ??
      true; //ถ้าไม่ใช่หน้าสุดท้ายให้รันต่อ ถ้าใช่น่าสุดท้ายจะเด้งไปหน้าเว็บเลย
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home: IntroScreen(),
      home: show
          ? IntroScreen()
          : HomeScreen(), //คำสั่งif ในรูปย่อ ifถ้าจริงไปหน้า IntroScreen() else ถ้าไม่ใช่ไปหน้า HomeScreen()
    );
  }
}
