import 'package:flutter/material.dart';
import 'package:tap_material/aci.dart';
import 'package:tap_material/dinding.dart';
import 'package:tap_material/lantai1.dart';
import 'package:tap_material/plester.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Hitung perkiraan bangunan"),
      ),
      body: Row(
        children: [
          Column(
            children: [
              Container(
                // color: Colors.blueGrey,
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Mau Membuat Apa Hari ini?",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Container(
                // color: Colors.deepOrange,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DindingPertama();
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.grey),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Dinding",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Plaster();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey),
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Plester Dinding",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: GestureDetector(
                        onTap: () {Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Aci();
                          }));},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey),
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Aci Dinding",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Lantai1();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey),
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Penutup Lantai",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
