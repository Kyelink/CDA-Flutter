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
  print('Mode de difficulté?');
  print('(1)Hard');
  print('(2)Regular');
  String r = stdin.readLineSync();
  while(!isInt(r)||int.parse(r)<1||int.parse(r)>2){
    print('(format invalide) Saisis un nombre :');
    print('(1)Hard');
    print('(2)Regular');
    r = stdin.readLineSync();
  };
  int rr=int.parse(r);
  bool hardMode = (rr==1);
  print('Pierre Papier ou Ciseaux?');
  print('(1)Pierre');
  print('(2)Papier');
  print('(3)Ciseaux');
  String age = stdin.readLineSync();
  while(!isInt(age)||int.parse(age)<1||int.parse(age)>3){
    print('(format invalide) Saisis un nombre :');
    print('(1)Pierre');
    print('(2)Papier');
    print('(3)Ciseaux');
    age = stdin.readLineSync();
  };
  int n = int.parse(age);
if(hardMode){  int repComputer = n%3 + 1;
  String repStr="";
  switch(repComputer){
    case 1:
      repStr='Pierre';
      break;
    case 2:
      repStr='Papier';
      break;
    case 3:
      repStr='Ciseaux';
      break;
  }
  print("Ordinateur choisi : "+ repStr);
  print("Ordinateur gagne toujours");}
else{
  int repComputer = Random().nextInt(3)+1;
  String repStr="";
  switch(repComputer){
    case 1:
      repStr='Pierre';
      break;
    case 2:
      repStr='Papier';
      break;
    case 3:
      repStr='Ciseaux';
      break;
  }
  if((repComputer==1&&n==2)||(repComputer==2&&n==3)||(repComputer==3&&n==1)){print("ordinateur choisi : "+repStr); print("Victoire!");}
  else if((repComputer==2&&n==1)||(repComputer==3&&n==2)||(repComputer==1&&n==3)){print("ordinateur choisi : "+repStr); print("Défaite!");}
  else{print("ordinateur choisi : "+repStr); print("Match nul!");}

}
}