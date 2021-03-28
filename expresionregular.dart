import 'dart:math';

void main(){
  int mas=0;
  RegExp exp = RegExp(r"([A-Z]+)");//busca uno o más palabras con caracteres a-z A-Z 0-9
  String str = "Parse my String A B C---";
  Iterable<RegExpMatch> matches = exp.allMatches(str);
  
  matches.forEach((match) {
  //print(str.substring(match.start, match.end));
  mas=mas+1;
  });
  print(mas);
}