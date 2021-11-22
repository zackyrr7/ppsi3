import 'package:flutter/material.dart';

class Lantai1 extends StatelessWidget {
  const Lantai1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hitung bangunan"),
      ),
      body: Row(
        children: [
          Column(
            children: [
              Container(
                // color: Colors.blueGrey,
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Mau Menggunakan bahan apa?",
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
                            "Keramik Ukuran 30 X 30",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey),
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Marmer ukuran 100 X 100",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey),
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Vinyl ukuran 30 X 30",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
