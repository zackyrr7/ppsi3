

import 'package:flutter/material.dart';
import 'package:tap_material/halaman_utama.dart';
import 'package:tap_material/profil_user.dart';


import 'package:url_launcher/url_launcher.dart';

class listitem extends StatefulWidget {
  listitem({Key? key}) : super(key: key);

  @override
  _listitemState createState() => _listitemState();
}

class _listitemState extends State<listitem> {
  final TextEditingController contNama = new TextEditingController();

  final TextEditingController contAlamat = new TextEditingController();

  final TextEditingController contPesanan = new TextEditingController();

  String nnama = "";

  String nalamat = "";

  String npesanan = "";

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
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Center(
                  child: Text(
                "Pesanan",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Nama",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: TextField(
                  controller: contNama,
                  maxLines: 2,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9)),
                    hintText: "Masukkan Nama",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Alamat",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: TextField(
                  controller: contAlamat,
                  maxLines: 4,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9)),
                    hintText: "Masukkan Alamat Anda",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Pesanan",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: TextField(
                  controller: contPesanan,
                  maxLines: 15,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9)),
                    hintText: "Masukkan Pesanan anda",
                  ),
                ),
              ),

              // Checkbox(value: , onChanged: onChanged,),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        
                        void _openWhatsAppChat() async {
                          nnama = contNama.text;
                        nalamat = contAlamat.text;
                        npesanan = contPesanan.text;
                          String phoneNumber = '+6285388943619';
                          String formatpesan = 'Halo Admin, saya $nnama beralamat di $nalamat \n ingin memesan $npesanan';
                          var url = 'https://wa.me/$phoneNumber?text=$formatpesan';
                          await launch(url);

                          
                        }_openWhatsAppChat();

                        ;
                      });
                    },
                    child: Text(
                      "Pesan",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
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


