import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:tap_material/halaman_utama.dart';

import 'package:tap_material/list.dart';
import 'package:tap_material/models/mitra.dart';
import 'package:tap_material/profil_toko.dart';
import 'package:tap_material/profil_user.dart';
import 'package:tap_material/widget/widget_mitra.dart';

class HalamanDelapan extends StatelessWidget {
  const HalamanDelapan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("SEMUA MITRA",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          body: GridView.builder(
            itemCount: mitras.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 2),
            itemBuilder: (context, index) => widgetmitra(
              mitra: mitras[index],
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilToko(mitra:mitras[index]))),
            ),
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
                        return listitem();
                      }));
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
                label: ("memesan"),
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
