import 'dart:io';
import 'dart:math';

String setCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
}

bool isInt(String str) {
  try{
    var value = int.parse(str);
  } on FormatException {
    return false;
  } 
  return true;
  
}

String pickRandStrInList(List<String> a) {
  return a[Random().nextInt(a.length)];
}

main() {
  
  List<String> lowers = [
    "a", "b", "c", "d", "e", "f","g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r","s", "t", "u", "v", "w", "x", "y", "z"
    ];
  List<String> uppers = [];
  for(var x in lowers){uppers.add(x.toUpperCase());}
  List<String> numbers = [
      "0", "1", "2", "3", "4", "5","6", "7", "8", "9"
      ];
  List<String> symbols = [
      "!", "%", "/", "?", "/", "*","\$", "#", "&", ",", ";",
      "§", "+", "-", ".", "_", ")", "(", "{", "}", "[", "]", "°"
      ];
  List<String> weaksPW = [
    "!egqeSrgq", "efbGBqeb%", "/yuk,sdFbf", "?fh,NG?gj,hk", ",gh/srGFhcb ", "*;j<DBDGHqwdgf","qsrfhXgBNBj,jjy\$", "sfhAZsr#", "ghyj;&dth,", "fgn,sryHDNFnsfsfe", "h,ngbfSv;sd",
    "dghnXV§,nq", "j;gns+V,jy", "d,j-?Sd,VFVh", "sn,B;FDS.;,f", ",fjgFDhfg_", "fyk;Jhj)hj", "jk;(DCVfgjhH,", ",fNGFgF,{dq", "kjFD;j,}jh", "[;j,;SDj,", ";hj,DFV;jk]", "hf;kDWB°hfj,ghn"
    ];


  print('Niveau de protection du MDP :');
  print('(1)Strong');
  print('(2)Weak');
  String r = stdin.readLineSync();
  while(!isInt(r)||int.parse(r)<1||int.parse(r)>2){
    print('(format invalide) Saisis un nombre :');
    print('(1)Strong');
    print('(2)Weak');
    r = stdin.readLineSync();
  };
  int rr=int.parse(r);
  bool isStrong = (rr==1);
  String pW = "";
  
  if(isStrong){


    int minSize = 6;
    int maxSize = 100;
    int size = minSize+Random().nextInt(maxSize-minSize+1);
    for(int i = 0; i<size; i++){
      int kindOfStr=Random().nextInt(4);
      switch(kindOfStr){
        case 0:
          pW+=(pickRandStrInList(uppers));
          break;
        case 1:
          pW+=(pickRandStrInList(lowers));
          break;
        case 2:
          pW+=(pickRandStrInList(symbols));
          break;
        case 3:
          pW+=(pickRandStrInList(numbers));
          break;
      }
    }

    //Ensures atleast one char of every kind;
    List<int> indexes = [];
    for(int i = 0; i<4; i++){
      int randLocation=0;
      do{randLocation=Random().nextInt(size);}
      while(indexes.contains(randLocation));
      indexes.add(randLocation);
      switch(i){
        case 0:
          pW=setCharAt(pW,randLocation,pickRandStrInList(uppers));
          break;
        case 1:
          pW=setCharAt(pW,randLocation,pickRandStrInList(lowers));
          break;
        case 2:
          pW=setCharAt(pW,randLocation,pickRandStrInList(symbols));
          break;
        case 3:
          pW=setCharAt(pW,randLocation,pickRandStrInList(numbers));
          break;
      }
    }


  




  }
  else{
    pW=pickRandStrInList(weaksPW);
  }
print("MDP genéré :");
print(pW);
  

}