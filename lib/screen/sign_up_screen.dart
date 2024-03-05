import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final re_passwordController = TextEditingController();

  signUpWithEmail() async {
    //สร้าง email & password
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog("Please return to the sign in page.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: non_constant_identifier_names
  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Color.fromARGB(255, 255, 193, 235),
            title: const Text('Created Successfully.'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
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
      body: Form(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Welcome to our community',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline6,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Text(
              '\n To get started, please provide your information to create an account. \n',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.subtitle1,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: nameController,
              hintText: 'Enter your name',
              obscureText: false,
              labelText: 'Name',
            ),
            const SizedBox(
              height: 20,
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
              obscureText: true,
              labelText: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: re_passwordController,
              hintText: 'Enter your password again',
              obscureText: true,
              labelText: 'Re-Password',
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(onTap: signUpWithEmail, hintText: 'Sign up'),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have a member?',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subtitle1,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 229, 168, 207),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign in.',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.subtitle1,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
