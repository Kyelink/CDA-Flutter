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
  print('Saisir un entier naturel');
  String age = stdin.readLineSync();
  while(!isInt(age)||int.parse(age)<0){
    print('(format invalide) Saisis un nombre :');
    age = stdin.readLineSync();
  };
  int n = int.parse(age);
  bool isPrime=true;

  
  if(n==2){isPrime=true;}
  else if(n==1){isPrime=false;}
  else{
    for(int i=2;i<=sqrt(n);i++){
      if(n%i==0){
        isPrime=false;
        break;
      }
    }
  }

  print(isPrime?"Premier":"Deuxième");

  

  

}