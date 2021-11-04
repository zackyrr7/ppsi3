import 'package:flutter/material.dart';
import 'package:tap_material/detail_barang.dart';
import 'package:tap_material/models/product.dart';
import 'package:sizer/sizer.dart';

class widgetProduk extends StatelessWidget {
  final Product produk;
  // final Function press;
  const widgetProduk({
    Key? key,
    required this.produk,
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
                  child: Image.asset(
                    produk.image,
                    fit: BoxFit.cover,
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
                      child: Text(produk.barang,
                          style: TextStyle(
                              fontSize: 8.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Text(produk.toko, style: TextStyle(fontSize: 8.sp))
                      ],
                    ),
                    Row(
                      children: [
                        Text("\Rp.${produk.price}",
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
