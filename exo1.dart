import 'dart:io';

bool isInt(String str) {
  try{
    print(str);
    var value = int.parse(str);
  } on FormatException {
    return false;
  } 
  return true;
  
}

main() {
  print('Saisis ton nom :');
  String nom = stdin.readLineSync();
  print('Saisis ton age :');
  String age = stdin.readLineSync();
  while(!isInt(age)||int.parse(age)<0||int.parse(age)>100){
    print('(format invalide) Saisis ton age :');
    age = stdin.readLineSync();
  };
  int n = int.parse(age);
  print(nom+" tu as 100 ans dans "+(100-n).toString()+" ans");
}