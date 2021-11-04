import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:sizer/sizer.dart';
import 'package:tap_material/registrasi.dart';

void main() {
  runApp(const HalamanSatu());
}

class HalamanSatu extends StatefulWidget {
  const HalamanSatu({Key? key}) : super(key: key);

  @override
  _HalamanSatuState createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xff79B4B7),
          body: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20.h),
                    // color: Colors.brown,
                    child: Column(
                      children: [
                        Container(
                          // color: Colors.black,
                          child: Center(
                              child: Text(
                            "Halo",
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                        Container(
                          // color: Colors.brown,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            "Selamat Datang di Aplikasi Tap Tap Material",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          )),
                        ),
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0)),
                          padding: EdgeInsets.all(40),
                          child: Image(
                            image: AssetImage(
                              "assets/images/Logo hitam.png",
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.brown,
                          margin: EdgeInsets.only(bottom: 50),
                          child: Center(
                              child: Text(
                            "Tap Tap Material",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.brown,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Registrasi();
                              }));
                            },
                            child: Text(
                              "Mulai",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
