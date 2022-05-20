import 'package:firebase_flutter02/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_flutter02/auth.dart';
import 'package:firebase_flutter02/home_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 3, bottom: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
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
                      "Sign Up",
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
                      signUp(emailController.text, passwordController.text)
                          .then((result) {
                        if (result == null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                        email: emailController.text,
                                      )));
                        } else {
                          // ignore: deprecated_member_use
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
              const SizedBox(height: 160),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Already have account ?',
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
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        'Login here',
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
        ],
      ),
    );
  }
}
