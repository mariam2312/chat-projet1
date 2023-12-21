// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, sized_box_for_whitespace, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import '../components/buttons';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                //to email design keybored
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextfieldDecoration.copyWith(
                    hintText: 'Enter Your Email')),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                //to disappear password
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextfieldDecoration.copyWith(
                    hintText: 'Enter Your Password')),
            const SizedBox(
              height: 24.0,
            ),
            Buttons(
              text: 'Register',
              color: Colors.blueAccent,
              onPressed: () async {
                print(email);
                print(password);
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email!, password: password!);
                  if (newUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
