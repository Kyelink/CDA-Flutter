import 'dart:io';


main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  a.sort();
  int i = 0;
  while(i<a.length&&a[i]<5){
    print(a[i]);
    i++;
  }

}