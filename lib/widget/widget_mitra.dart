import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tap_material/models/mitra.dart';


class widgetmitra extends StatelessWidget {
  final Mitra mitra;
  final Function press;
  const widgetmitra({
    Key? key,
    required this.mitra,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.41,
        height: MediaQuery.of(context).size.height * 0.24,
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
                onTap: () {press();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    
                  // }));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: Image.asset(mitra.image),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    10, 30 + MediaQuery.of(context).size.height * 0.11, 10, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 5),
                      child: Text(mitra.nama,
                          style: TextStyle(
                              fontSize: 9.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 10,
                        ),
                        Text(mitra.alamat, style: TextStyle(fontSize: 9.sp))
                      ],
                    ),
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