import 'dart:io';


main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List<int> b =  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  List<int> inter = [];
  a={...a}.toList();
  b={...b}.toList();
  a.sort();
  b.sort();
  for(int i=0;i<a.length;i++){
    if(b.contains(a[i])){inter.add(a[i]);}
  }


  print(inter);


}