import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tap_material/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:tap_material/main.dart';

class Registrasi extends StatefulWidget {
  Registrasi({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Kamu Sudah berhasil Mendaftar"),
            actions: [
              ElevatedButton(
                child: Text("Masuk"),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AuthenticationWrapper();
                  }));
                },
              )
            ],
          );
        });
  }

  createAlertDialog2(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Email Yang didaftarkan sudah pernah di pakai"),
            actions: [
              ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AuthenticationWrapper();
                  }));
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(30),
        child: ListView(children: [
          Center(
              child: Text(
            "Daftar",
            style: TextStyle(
                fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
          )),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "E-mail",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
                hintText: "Masukkan alamat e-mail",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Password",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
                hintText: "Masukkan Password",
              ),
            ),
          ),

          // Checkbox(value: , onChanged: onChanged,),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await Firebase.initializeApp();
                  UserCredential user = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } on FirebaseAuthException catch (e) {
                  
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                    createAlertDialog2(context);
                  }else{
                     Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Text(
                "Daftar",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Sudah mempunyai akun? ",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  child: Text(
                    "Login",
                    style:
                        TextStyle(color: Colors.lightBlueAccent, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  },
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
