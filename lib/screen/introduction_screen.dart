import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> page = [
    PageViewModel(
      //สร้างหน้าแรก
      title: 'Independent',
      body:
          'Cats are known for their independent nature. They often prefer to do things on their own terms and may not always seek attention or affection from humans but they may show their affection through purring, rubbing against their owners, or sitting in their laps.',
      footer: SizedBox(
        height: 45,
        width: 100,
        child: ElevatedButton(
            // ElevatedButton สร้างปุ่มกด
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Text('CUTE')),
      ),

      image: Image.network(
          'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?q=80&w=2043&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Curious',
      body:
          'Cats have a natural curiosity and love to explore their surroundings. They may investigate new objects, sounds, or places with great interest.',
      footer: SizedBox(
        height: 45,
        width: 100,
        child: ElevatedButton(
            // ElevatedButton สร้างปุ่มกด
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Text('The flowers are beautiful too ^ ^')),
      ),
      image: Image.network(
          'https://images.unsplash.com/photo-1586042091284-bd35c8c1d917?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Playful',
      body:
          'Cats are playful creatures and enjoy engaging in activities that stimulate their minds and bodies. They may chase toys, pounce on imaginary prey, or playfully wrestle with other cats or humans.',
      footer: SizedBox(
        height: 45,
        width: 100,
        child: ElevatedButton(
            // ElevatedButton สร้างปุ่มกด
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Text('Naughty but cute')),
      ),
      image: Image.network(
          'https://plus.unsplash.com/premium_photo-1677545183884-421157b2da02?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAT'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: page,
        showSkipButton: true, //สร้างปุ่มโชว์สคริป
        skip: const Text('Skip'),
        showDoneButton: true, //แสดงปุ่มสุดท้าย
        done: Text('Done'),
        showNextButton: true,

        //ไปถึงปุ่มสุดท้าย หน้าสุดท้าย ให้ไปหน้าแรก homescreen
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,

        //ปรับขนาด สี ของปุ่มเปลี่ยนหน้า
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Color.fromARGB(255, 255, 174, 201),
          activeColor: Color.fromARGB(255, 122, 209, 255),
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  //สร้างฟังก์ชั่น นอกวิตเจ็ต อยู่ในclass
  //ถ้าเรากด onDone จะกระโดดไปหน้า homescreen
  void onDone(context) async {
    final pefers = await SharedPreferences.getInstance();
    await pefers.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
