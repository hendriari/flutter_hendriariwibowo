import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class Barcodes extends StatelessWidget {
  const Barcodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            _barcode1(),
            _barcode2(),
          ],
        ),
      ),
    );
  }

  Widget _barcode1() {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 120,
              width: 250,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(2, 3), color: Colors.black26, blurRadius: 3)
              ]),
              child: BarcodeWidget(
                data: 'hendri ari wibowo',
                barcode: Barcode.telepen(),
                height: 100,
                width: 100,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 120,
              width: 250,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(2, 3), color: Colors.black26, blurRadius: 3)
              ]),
              child: BarcodeWidget(
                data: 'alterra academy',
                barcode: Barcode.telepen(),
                height: 100,
                width: 100,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 120,
              width: 250,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(2, 3), color: Colors.black26, blurRadius: 3)
              ]),
              child: BarcodeWidget(
                data: 'flutter asik',
                barcode: Barcode.telepen(),
                height: 100,
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _barcode2() {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 150,
            width: 150,
            child: BarcodeWidget(
              data: 'hendri ari wibowo',
              barcode: Barcode.qrCode(),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            height: 150,
            width: 150,
            child: BarcodeWidget(
              data: 'alterra academy',
              barcode: Barcode.qrCode(),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 150,
            width: 150,
            child: BarcodeWidget(
              data: 'flutter asik',
              barcode: Barcode.qrCode(),
            ),
          ),
        ],
      ),
    );
  }
}
