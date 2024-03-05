import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/icon_button.dart';
import 'package:onboarding_screen/screen/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onboarding_screen/screen/todolist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Text editting controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  signInWithEmail() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog("You can enjoy activities here.");
    } on FirebaseAuthException catch (e) {
      print('Failed with error code : ${e.code}');
      print(e.message);

      if (e.code == 'invalid-email') {
        _showMyDialog('No user found for that email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        _showMyDialog('Wrong password provided for that user.');
      }
    }
  }

  // ignore: non_constant_identifier_names
  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            // backgroundColor: Color.fromARGB(255, 224, 249, 255),
            title: const Text('Login Successfully.'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToDoListScreen()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 55, 163, 182),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Hello ready to get started",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please sign-in with your email and password",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Enter your email',
                obscureText: false,
                labelText: 'Email',
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                obscureText: true, //ปกปิดเป็นความลับ
                labelText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(onTap: signInWithEmail, hintText: 'Sign In'),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Color.fromARGB(255, 49, 56, 255),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'or continue with',
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displaySmall,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(255, 173, 254, 199)),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Color.fromARGB(255, 49, 56, 255),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconButton(
                    imagePath: 'assets/images/google.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyIconButton(
                    imagePath: 'assets/images/apple.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: const Color.fromARGB(255, 173, 254, 199)),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Register now',
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 80, 255, 136)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
