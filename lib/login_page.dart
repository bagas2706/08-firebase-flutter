import 'package:firebase_flutter02/auth.dart';
import 'package:firebase_flutter02/home_screen.dart';
import 'package:firebase_flutter02/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_flutter02/sign_in.dart';
import 'package:firebase_flutter02/first_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const FlutterLogo(size: 150),
            const SizedBox(height: 20),
            const Text(
              'Haiii,\n Selamat Datang',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: emailController,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: passwordController,
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: ElevatedButton(
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () async {
                    signIn(emailController.text, passwordController.text)
                        .then((result) {
                      if (result == null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      email: emailController.text,
                                    )));
                        // ignore: duplicate_ignore
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            result,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ));
                      }
                    });
                  }),
            ),
            const SizedBox(height: 20),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Divider(thickness: 1, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _signInButton(),
            const SizedBox(height: 130),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Don’t have account ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text(
                      'Register here',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _signInButton() {
    return RaisedButton(
      color: Colors.lightBlue,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const FirstScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Image(image: AssetImage("assets/google.png"), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign In With Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
