import 'package:flutter/material.dart';
import 'package:firebase_flutter02/login_page.dart';
import 'package:firebase_flutter02/sign_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home -  Bagas Prambudi(2031710108)'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                email,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.lightBlue,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'SIGN OUT',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
