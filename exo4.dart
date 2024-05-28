import 'dart:io';
import 'dart:math';

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
  while(!isInt(age)||int.parse(age)<0){
    print('(format invalide) Saisis un nombre :');
    age = stdin.readLineSync();
  };
  int n = int.parse(age);
  List<int> a = [];
  for(int i=1;i<=sqrt(n);i++){
    if(n%i==0){
      a.add(i);
      if(n/i!=i){a.add((n/i).round());}
    }
  }
  a.sort();
  print("diviseurs : ");
  print(a);

}