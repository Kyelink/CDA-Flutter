import 'dart:io';

bool isInt(String str) {
  try{
    var value = int.parse(str);
  } on FormatException {
    return false;
  } 
  return true;
  
}

main() {
  print('Saisis un nombre :');
  String age = stdin.readLineSync();
  while(!isInt(age)){
    print('(format invalide) Saisis un nombre :');
    age = stdin.readLineSync();
  };
  int n = int.parse(age);
  print((n%2==0)?"pair":"impair");
}