import 'package:flutter/material.dart';
import 'package:tap_material/detail_barang.dart';
import 'package:tap_material/models/barang_mitra.dart';
import 'package:sizer/sizer.dart';

class widgetProdukMitra extends StatelessWidget {
  final BarangMitra1 barangMitra1;
  // final Function press;
  const widgetProdukMitra({
    Key? key,
    required this.barangMitra1,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Detail();
                  }));
                },
                child: Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: Center(
                    child: Image.asset(
                      barangMitra1.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                // color: Colors.blue,
                height: 50,
                margin: EdgeInsets.fromLTRB(
                    10, 30 + MediaQuery.of(context).size.height * 0.11, 10, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 5),
                      child: Text(barangMitra1.barang,
                          style: TextStyle(
                              fontSize: 8.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    
                    Row(
                      children: [
                        Text("\Rp.${barangMitra1.price}",
                            style: TextStyle(fontSize: 7.sp)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
