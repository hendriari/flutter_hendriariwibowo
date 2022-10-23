import 'package:flutter/material.dart';
import 'package:praktik/util/color.dart';

class MyFavoriteBook extends StatelessWidget {
  const MyFavoriteBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Center(
        child: Text(
          'Buku Favorit Kosong',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
