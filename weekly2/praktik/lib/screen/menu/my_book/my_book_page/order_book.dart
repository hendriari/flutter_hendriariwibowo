import 'package:flutter/material.dart';
import 'package:praktik/util/color.dart';

class OrderBookPage extends StatelessWidget {
  const OrderBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Center(
        child: Text(
          'Belum Ada Pesanan',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
