import 'package:flutter/material.dart';

class DindingPertama extends StatefulWidget {
  const DindingPertama({Key? key}) : super(key: key);

  @override
  _DindingPertamaState createState() => _DindingPertamaState();
}

class _DindingPertamaState extends State<DindingPertama> {
  final TextEditingController lebarCont = TextEditingController();
  final TextEditingController panjangCont = TextEditingController();
  bool _validatelebar = false;
  bool _validatepanjang = false;
  double lebar = 0;
  double panjang = 0;
  double total = 0;
  String hasil = "";
  double semen = 12.13;
  double pasir = 0.388;
  double besi = 0.28;
  double bata = 12.5;
  double ttsemen = 0;
  double ttpasir = 0;
  double ttbesi = 0;
  double ttbata = 0;
  String tsemen = "";
  String tbesi = "";
  String tbata = "";
  String tpasir = "";
  String akhir = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dinding"),
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
                        // color: Colors.pink,
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Lebar Dinding yang ingin di buat?",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  controller: lebarCont,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      hintText: "Ukuran lebar dalam meter",
                                      errorText: _validatelebar
                                          ? 'Isi Nilai lebar terlebih dahulu'
                                          : null),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.pink,
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Panjang Dinding yang ingin di buat?",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  controller: panjangCont,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      hintText: "Ukuran Panjang dalam meter",
                                      errorText: _validatepanjang
                                          ? 'Isi Nilai panjang terlebih dahulu'
                                          : null),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lebarCont.text.isEmpty
                                ? _validatelebar = true
                                : _validatelebar = false;
                            panjangCont.text.isEmpty
                                ? _validatepanjang = true
                                : _validatepanjang = false;
                            void _hitung() {
                              lebar = double.parse(lebarCont.text);
                              panjang = double.parse(panjangCont.text);
                              total = lebar * panjang;
                              ttbata = total * bata;
                              ttpasir = total * pasir;
                              ttbesi = total * besi / 0.395;
                              ttsemen = total * semen / 40;
                              tpasir = ttpasir.toStringAsFixed(2);
                              tsemen = ttsemen.toStringAsFixed(2);
                              tbesi = ttbesi.toStringAsFixed(2);
                              tbata = ttbata.toStringAsFixed(2);

                              hasil = total.toStringAsFixed(2);
                            }

                            _hitung();
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          child: Center(
                              child: Text(
                            "Hitung",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 2),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Dengan luas dinding sebesar $hasil, maka anda membutuhkan: ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width * 0.95,
                          // color: Colors.blue,
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            defaultColumnWidth: FixedColumnWidth(100),
                            children: [
                              TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Barang Yang Dibutuhkan",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Banyaknya",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Perkiraan Harga",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Semen",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(tsemen,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Perkiraan Harga",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  )
                                ],
                              ),
                              TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Text("Pasir",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(tpasir,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Perkiraan Harga",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  )
                                ],
                              ),
                              TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Text("Besi",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('$tbesi Meter' ,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Perkiraan Harga",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
