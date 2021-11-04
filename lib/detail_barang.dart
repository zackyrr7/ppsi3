import 'package:flutter/material.dart';
import 'package:tap_material/halaman_utama.dart';
import 'package:sizer/sizer.dart';


class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HalamanEmpat();
            }));
          },
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image(
                      image: AssetImage(
                        "assets/images/batu.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Colors.yellow,
                    width: MediaQuery.of(context).size.width,
                    height: 15.h,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Batu bata",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Rp.100.00",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(onTap: () {},
                              // onTap: () {
                              //   Navigator.push(context,
                              //       MaterialPageRoute(builder: (context) {
                              //     return ProfilToko();
                              //   }));
                              // },
                              child: Text(
                                "Tb Namiroh Jaya",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.lightBlue),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 10,
                        color: Color(0xff79B4B7),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        height: 10,
                        color: Colors.black45,
                        width: MediaQuery.of(context).size.width * 0.5,
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment(0, 1),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.lime,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 75,
                            // color: Colors.blue,
                            child: Center(
                                child: Text(
                              "Beli Langsung",
                              style: TextStyle(
                                color: Color(0xff79B4B7),
                              ),
                            )),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color(0xff79B4B7),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        GestureDetector(onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 75,
                            // color: Colors.blue,
                            child: Center(
                                child: Text(
                              "+ Keranjang",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                            decoration: BoxDecoration(
                              color: Color(0xff79B4B7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
      }),
    );
  }
}
