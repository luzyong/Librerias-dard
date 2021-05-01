import "test.dart";
import 'dart:io';
import 'dart:async';
class Respuesta{
  var intro;
  var respuesta;
  responde(){
    intro = stdin.readLineSync();
    if(intro == ''){
      respuesta = '0';
    }
    else{
      respuesta = intro;
    }
    return respuesta;
  }
  
}