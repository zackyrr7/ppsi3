import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:tap_material/list.dart';

import 'package:tap_material/models/mitra.dart';
import 'package:tap_material/models/product.dart';
import 'package:tap_material/semua_mitra.dart';
import 'package:tap_material/halaman_semua_produk.dart';

import 'package:tap_material/profil_toko.dart';
import 'package:tap_material/profil_user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tap_material/widget/widget_mitra.dart';
import 'package:tap_material/widget/widget_produk.dart';
import 'package:url_launcher/url_launcher.dart';




void main() {
  runApp(const HalamanEmpat());
}

class HalamanEmpat extends StatefulWidget {
  const HalamanEmpat({Key? key}) : super(key: key);

  @override
  _HalamanEmpatState createState() => _HalamanEmpatState();
}

class _HalamanEmpatState extends State<HalamanEmpat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Image(
            image: AssetImage("assets/images/Logo taptap.png"),
          ),
          title: Text(
            "TAP TAP MATERIAL",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _openWhatsAppChat();
              },
              icon: Icon(FontAwesomeIcons.whatsapp),
              color: Colors.black,
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(19),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      "MITRA KAMI",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HalamanDelapan();
                        }));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(color: Color(0xff79B4B7)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 400,
                child: Expanded(
                    child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 2),
                  itemBuilder: (context, index) => widgetmitra(
                    mitra: mitras[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProfilToko(mitra: mitras[index]))),
                  ),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      "PRODUK",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HalamanDelapanToko();
                        }));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(color: Color(0xff79B4B7)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 400,
                child: Expanded(
                    child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.9),
                  ),
                  itemBuilder: (context, index) =>
                      widgetProduk(produk: products[index]),
                )),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
      ),
    );
  }
}

void _openWhatsAppChat() async {
  String phoneNumber = '+6285388943619';
  String kalimat = 'Halo Admin';
  var url = 'https://wa.me/$phoneNumber?text=$kalimat';
  await launch(url);
}

