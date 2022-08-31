void main() {

  ///nilai faktorial 10
  num a = 10.0;
  num factorialA = 1;
  for (var i = a; i >= 1; i--) {
    factorialA *= i;
  }
  print('nilai Faktorial dari 10! adalah : $factorialA');

  ///nilai faktorial 20
  num b = 20.0;
  num factorialB = 1;
  for (var o = b; o >=1; o--){
    factorialB *= o;
  }
  print('nilai Factorial dari 20! adalah : $factorialB');

  ///nilai faktorial 30
  num c = 30.0;
  num factorialC = 1;
  for(var p = c; p >=1; p--){
    factorialC *= p;
  }
  print('nilai Factorial dari 30! adalah : $factorialC');
}
