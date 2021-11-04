import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tap_material/authentication_service.dart';
import 'package:tap_material/halaman_utama.dart';
import 'package:provider/provider.dart';

import 'package:tap_material/list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_material/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilUser extends StatefulWidget {
  const ProfilUser({Key? key}) : super(key: key);

  @override
  _ProfilUserState createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  bool _isEditingName = false;
  bool _isEditingPhone = false;
  bool _isEditingAddress = false;

  final namaCont = TextEditingController();
  final hpCont = TextEditingController();
  final alamatCont = TextEditingController();

  String initialNameText = "";
  String initialPhoneText = "";
  String initialAddressText = "";
  String initialEmailText = "";

  var _nama = "Anda Belum Memasukan Nama Anda";
  var _nomor = "Anda Belum Memasukan Nomor Hp Anda";
  var _alamat = "Anda belum Memasukan Alamat Anda";

  _updateNama(updatenya) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString('update', updatenya);
    });
  }

  _updateNomor(updatenya2) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString('update2', updatenya2);
    });
  }

  _updateAlamat(updatenya3) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString('update1', updatenya3);
    });
  }

  _muatUpdate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _nama = (pref.getString('update') ?? '');
      _nomor = (pref.getString('update2') ?? '');
      _alamat = (pref.getString('update1') ?? '');
    });
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Kamu telah keluar :(\n Datang Lagi ya"),
            actions: [
              ElevatedButton(
                child: Text("Oke"),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MyApp();
                  }));
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await _muatUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          title: Text(
            "PROFIL",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 115,
                    height: 115,
                    decoration: ShapeDecoration(
                        color: Colors.grey, shape: CircleBorder()),
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text("Hallo !", style: TextStyle(fontSize: 25)),
                          Text(
                            _nama,
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(_nomor, style: TextStyle(fontSize: 10)),
                          Text(_alamat, style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(13),
              child: Text(
                "Pengaturan Dasar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              height: 150,
              // color: Colors.amber,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.lock),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Nama",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: namaCont,
                      decoration: InputDecoration(
                          hintText: "Masukan Nama Anda",
                          errorText:
                              _isEditingName ? 'Nama Harus di Masukan' : null),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Divider(),
            ),
            Container(
              height: 150,
              // color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.phone),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Nomor Handphone",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: hpCont,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Masukan Nomor Handphone anda",
                          errorText: _isEditingPhone
                              ? 'Nomor Handphone Harus di Masukan'
                              : null),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Divider(),
            ),
            Container(
              height: 150,
              // color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.location_on)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Alamat",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: alamatCont,
                      decoration: InputDecoration(
                          hintText: "Masukan Alamat anda",
                          errorText: _isEditingAddress
                              ? 'Alamat Harus di Masukan'
                              : null),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Divider(),
            ),
            GestureDetector(
              onTap: () {
                _updateNama(namaCont.text);
                _updateNomor(hpCont.text);
                _updateAlamat(alamatCont.text);
                _muatUpdate();
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.blueAccent,
                child: Center(
                    child: Text(
                  "Masukan data dan perbarui",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(13),
              child: Text(
                "Tentang Kami",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                _openIg();
              },
              child: Container(
                height: 50,
                width: 50,
                child: Center(child: Text("Kunjungi Instagram kami")),
                decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(100)),
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            GestureDetector(
              onTap: () {
                _openFB();
              },
              child: Container(
                height: 50,
                width: 50,
                child: Center(child: Text("Kunjungi Facebook kami")),
                decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(100)),
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            GestureDetector(
              onTap: () {
                _openIGB();
              },
              child: Container(
                height: 50,
                width: 50,
                child: Center(child: Text("Kunjungi Instagram Betukang.id")),
                decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(100)),
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            ElevatedButton(
              child: Text("Keluar"),
              onPressed: () {
                context.read<AuthenticationService>().signOut();
                createAlertDialog(context);
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
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

void _openIg() async {
  var url = 'https://www.instagram.com/taptap_material/';
  await launch(url);
}
void _openIGB() async {
  var url = 'https://www.instagram.com/betukang.id/';
  await launch(url);
}

void _openFB() async {
  var url = 'https://web.facebook.com/Tap-tap-Material-101425728990848/';
  await launch(url);
}
