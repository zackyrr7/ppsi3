import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tap_material/detail_barang.dart';
import 'package:tap_material/halaman_utama.dart';
import 'package:tap_material/list.dart';
import 'package:tap_material/models/mitra.dart';
import 'package:tap_material/profil_user.dart';


class ProfilToko extends StatefulWidget {
  final Mitra mitra;
  const ProfilToko({Key? key, required this.mitra}) : super(key: key);

  @override
  _ProfilTokoState createState() => _ProfilTokoState();
}

class _ProfilTokoState extends State<ProfilToko> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            title: const Text('PROFIL TOKO',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            backgroundColor: Color(0xFFFFFFFF),
            elevation: 10,
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 15.h,
                          color: Color(0xff79B4B7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundImage:
                                      AssetImage('assets/images/Logo.jpeg'),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 30, 0, 0),
                                child: Column(
                                  children: [
                                    Text(
                                      "TOKO",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Pontianak",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "JL. Ayani",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Produk(context),
                        Produk(context),
                        Produk(context),
                        // Container(
                        //   height: 400,
                        //   child: Expanded(
                        //       child: GridView.builder(
                        //     itemCount: 6,
                        //     gridDelegate:
                        //         SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 2,
                        //       childAspectRatio: MediaQuery.of(context)
                        //               .size
                        //               .width /
                        //           (MediaQuery.of(context).size.height / 1.9),
                        //     ),
                        //     itemBuilder: (context, index) => widgetProdukMitra(
                        //         barangMitra1: barangMitra1[index]),
                        //   )),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff79B4B7),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(.60),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HalamanEmpat();
                    }));
                  },
                  icon: Icon(Icons.home),
                ),
                label: ("Beranda"),
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return listitem();
                      }));
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
                label: ("Memesan"),
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfilUser();
                      }));
                    },
                    icon: Icon(Icons.person)),
                label: ("Akun"),
              ),
            ],
          ),
        ));
  }

  Container Produk(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30.h,
      // color: Colors.yellow,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              // color: Colors.red,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.41,
                height: 50.h,
                child: Card(
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Detail();
                          }));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.41,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/batu.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            10,
                            30 + MediaQuery.of(context).size.height * 0.11,
                            10,
                            10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 5),
                              child: Text("Tb. Namiroh Jaya",
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 10,
                                ),
                                Text("Jl. A. Yani",
                                    style: TextStyle(fontSize: 9.sp)),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Rp. 50.000"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // color: Colors.red,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.41,
                height: 50.h,
                child: Card(
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Detail();
                          }));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.41,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/batu.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            10,
                            30 + MediaQuery.of(context).size.height * 0.11,
                            10,
                            10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 5),
                              child: Text("Tb. Namiroh Jaya",
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 10,
                                ),
                                Text("Jl. A. Yani",
                                    style: TextStyle(fontSize: 9.sp))
                              ],
                            ),
                            Row(
                              children: [
                                Text("Rp. 50.000"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
