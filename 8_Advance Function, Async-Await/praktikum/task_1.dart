void main() {
  ambilOrder().then((value) {
    print('You ordered: $value');
  })
      .catchError((error) {
    print('Sorry. $error');
  });
  print('Getting your order...');
}

Future<String> ambilOrder() {
  return Future.delayed(Duration(seconds: 3), () {
    var stockTersedia = false;
    if (stockTersedia) {
      return 'Coffee Boba';
    } else {
      throw 'Our stock is not enough.';
    }
  });
}