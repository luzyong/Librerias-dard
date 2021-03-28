//comprension set, get, sobrecarga y como importar clase
import 'dart:math';
class Persona{
  String _nombre='';
  String _sexo='';
  int _edad=0;
  var _dni;
  var _numerojugador;
  double _peso=0.0;
  double _altura=0.0;
  int valor=0;
 
 Persona(this._nombre,this._sexo, this._edad, this._peso, this._altura);
 Persona.segunda(this._nombre, this._sexo, this._edad);
 Persona.defecto(){
   
 }
 set nombre(String nombre)=>_nombre=nombre;
 String get nombre=>_nombre;
 set sexo(String sexo)=>_sexo=sexo;
 String get sexo=>_sexo;
 set edad(int edad)=>_edad=edad;
 int get edad=>_edad;
 set peso(double peso)=>_peso=peso;
 double get peso=>_peso;
 set altura(double altura)=>_altura=altura;
 double get altura=>_altura;
  /*Persona.defecto(){
   _nombre='';
   _sexo='H';
   _edad=18;
   _peso=70.0;
   _altura=1.80;
 }*/
 //void Set Persona(){

 //}
 int calculaIMC(double peso, double altura){
   double imc=(peso)*(pow(altura,2));
   
   if(imc<20){
     valor=-1;
   }
   else if(imc>=20&&imc<=25){
     valor= 0;
   }
  else if(imc>25){
    valor=1;
  }
  return valor;
 }
 bool mayoredad(int edad){
   if(edad>17){
     return true;
   }
   else{
     return false;
   }
 }
 String compruebasexo(String sexo){
   if(sexo=='H'||sexo=='M'){
     
   }
   else{
     sexo = 'H';
   }
   return sexo;
 }
 toString()=>'Nombre: $nombre, edad: $edad, sexo: $sexo, estatura: $altura, peso: $peso '; 
}

