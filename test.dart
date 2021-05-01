import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:sqljocky5/sqljocky.dart';
import 'preguntas.dart';
import 'respuestas.dart';
import 'dart:core';
//import 'prueba.dart';
class Test{
  var _lista =[];
  var _regresa;
  var _preguntas=[];
  int i = 0;
  var n, results;
  var recibe;
  var respuesta;
  int tam=0;
  Duration tiempo = Duration(seconds:5);
  String _pregunta='';
  
  

  Test(){}
  /*En el método cargar() se debe poner async porque es un método asíncrono que devuelve un valor hasta que termina la operación */
  /*Un método marcado como async devolverá el tipo de dato cuando termina de ejecutar todo el cuerpo del método*/
  /*Si se completa correctamente y el método devuelve una variable, esta tendrá el valor asignado, de lo contrario devolverá null (si no hay return) */
  /*await detiene la lectura del cuerpo mientras evalúa la expresión. En este ejemplo nos permite devolver el valor desde processLines */
  get preguntas => _preguntas;
  get pregunta => _pregunta;
  get regresa => _regresa;

  cargar() async{//método que lee el documento y llama a la función que guarda las preguntas en la variable
   var s = ConnectionSettings(
    user: "root",
    password: "lmyr1399",
    host: "localhost",
    port: 3306,
    db: "prueba",
  );
  var conn = await MySqlConnection.connect(s);
    results = await conn.execute('select * from preguntas');
    results.forEach((Row row) {
        // Access columns by index
        //print('id: ${row[0]}, pregunta: ${row[1]}');
        _lista=[row[1],row[2],row[3],row[4],row[5],row[6]];
        _preguntas.insert(i, _lista);
        i+=1;
    });
    await conn.close();
    return _preguntas;
  }

  
  realizarTest() async{
    Pregunta preguntax = Pregunta();
    Respuesta responde = Respuesta();
    n = await this.cargar();
    tam=n.length;
    print(tam);
    print('Comienza el test en...');
    sleep(Duration(seconds:2));
    for(i=3;i!=0;i--){
      print("\x1B[2J\x1B[0;0H");//"Limpia" la pantalla en consola
      print(i);
      sleep(Duration(seconds:1));
    }
    for(i=0;i<tam;i++){
      print("\x1B[2J\x1B[0;0H");
      await preguntax.cargarPregunta(tam);
      recibe=responde.responde();
      respuesta = int.parse(recibe);
      preguntax.comprobarRespuesta(respuesta);
      sleep(Duration(seconds:1));
    }
    print("\x1B[2J\x1B[0;0H");
    preguntax.mostrarPuntos();
  }
 
}