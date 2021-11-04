import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tap_material/halaman_utama.dart';
import 'package:tap_material/profil_user.dart';


class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
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
            title: const Text(
              'KERANJANG',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            backgroundColor: Color(0xFFFFFFFF),
            elevation: 10,
          ),
          body: Row(
            children: [
              Column(
                children: [
                  ListView(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellowAccent,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                            hintText: "Masukkan alamat e-mail",
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
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
                        return Keranjang();
                      }));
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
                label: ("Keranjang"),
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
}
