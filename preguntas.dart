import "test.dart";
class Pregunta{
  var recoge;
  String _pregunta='';
  List _opciones=['','','',''];
  int _puntos=0;
  int i=0;
  int _respuesta=0;
  bool p=false;
  bool o=false;
  Test test = Test();
  //Pregunta(this._pregunta);

  String get preguntax=>_pregunta;
  List get opciones=>_opciones;
  int get respuesta=>_respuesta;
  int get puntos=>_puntos;

  cargarPregunta(int tamano)async{
      recoge=await test.cargar();//Recoge es una matriz o arreglo de arreglos
      if(i<tamano){
      _pregunta = recoge[i][0];
      for(int j=1;j<5;j++){
        _opciones[j-1]=recoge[i][j];
      }
      _respuesta=recoge[i][5];
      i+=1;
   }
   
   print(_pregunta);
   for(int k=0; k<_opciones.length;k++){
     print(_opciones[k]);
   }
   
     //Pregunta
     //recoge[posicion del arreglo extreno o fila de matriz][posicion del arreglo interno o columna de matriz]
  /*print(preguntas[2][1]); //Opcion1
  print(preguntas[2][2]); //Opcion2
  print(preguntas[2][3]); //Opcion3
  print(preguntas[2][4]); //Opcion4
  print(preguntas[2][5]); //RespuetaCorrecta
  */
  }

 int comprobarRespuesta(int respuestas){
    if(respuestas==_respuesta){
      print('Respuesta correcta');
      _puntos+=1;
    }
    else{
      print('Respuesta incorrecta');
    }
    return _puntos;
  }
  mostrarPuntos(){
    print('Tu puntuación es: $puntos');
  }
  
}

