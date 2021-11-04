import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:tap_material/halaman_utama.dart';
import 'package:tap_material/keranjang.dart';
import 'package:tap_material/profil_user.dart';
import 'package:sizer/sizer.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

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
              'CHECKOUT',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            backgroundColor: Color(0xFFFFFFFF),
            elevation: 10,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.notifications, color: Colors.black),
              ),
            ],
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight),
                child: (Row(
                  children: [
                    Column(
                      children: [
                        Barang(context),
                        Barang(context),
                        Barang(context),
                        Barang(context),
                        Barang(context),
                        Barang(context),
                        Divider(color: Colors.black),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Total: ",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Text("Rp 120.000",style: TextStyle(fontSize: 15.sp))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Checkout();
                              }));
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  "KONFIRMASI",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xff79B4B7),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
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

  Container Barang(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Color(0xffCAB6B6).withOpacity(0.2),
      )),
      // margin: EdgeInsets.only(top: 5),

      height: 20.h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            // color: Colors.white,
            height: 18.h,
            width: 35.w,
            child: Image(
              image: AssetImage("assets/images/batu.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // color: Colors.white,
            height: 18.h,
            width: 64.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Batu",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.shop,
                          color: Colors.grey,
                        ),
                        Text(
                          "Tb. Sinar Mentari Pagi",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "harga: ",
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                              Text(
                                "Rp. 10.000",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Ongkos: ",
                                    style: TextStyle(fontSize: 12.sp),
                                  ),
                                ],
                              ),
                              Text(
                                "Rp. 10.000",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Container(
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total: ",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Text(
                        "Rp. 20.000",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
