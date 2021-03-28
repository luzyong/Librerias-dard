import 'dart:math';
class Password{
  double _longitud=8.0;
  String _contrasena='';

  Password(){
    _longitud=8.0;
  }
  Password.longitud(this._longitud);

  String generaContrasena(bool _isWithLetters, bool _isWithUppercase,
    bool _isWithNumbers, bool _isWithSpecial, double _numberCharPassword){

  //Define los caracteres permitidos en la contraseña
  String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String _numbers = "0123456789";
  String _special = "@#=+!£\$%&?[](){}";

  //Crea el string que guarda los caracteres permitidos
  String _allowedChars = "";

  //Coloca los caracteres permitidos según los valores de entrada
  _allowedChars += (_isWithLetters ? _lowerCaseLetters : '');
  _allowedChars += (_isWithUppercase ? _upperCaseLetters : '');
  _allowedChars += (_isWithNumbers ? _numbers : '');
  _allowedChars += (_isWithSpecial ? _special : '');

  int i = 0;
  String _contrasena = "";

  //Crea la contraseña
  while (i < _numberCharPassword.round()) {//mientras i sea menor al tamaño de contraseña
    //obtiene un int random
    int randomInt = Random.secure().nextInt(_allowedChars.length);
    //obtiene una cadena random con los caracteres permitidos
    _contrasena += _allowedChars[randomInt];
    i++;
  }

  return _contrasena;
}
  bool esFuerte(String contrasena){
    int may=0;
    int min=0;
    int nume=0;
    RegExp expmay = RegExp(r"([A-Z]?)");//busca uno o más palabras con caracteres a-z A-Z 0-9 el ? significa 0 o 1 de los caracteres definidos
    RegExp expmin = RegExp(r"([a-z]?)");
    RegExp expnum = RegExp(r"([0-9]?)");
    String str = contrasena;
    Iterable<RegExpMatch> matchesmay = expmay.allMatches(str);//es una variable del tipo iterable y guarda el valor que coincide con la expresion regular
    Iterable<RegExpMatch> matchesmin = expmin.allMatches(str);
    Iterable<RegExpMatch> matchesnum = expnum.allMatches(str);
    matchesmay.forEach((match) { //función variable iterable por cada match hace lo de adentro
      if(str.substring(match.start, match.end)!=''){
        may=may+1; 
      }    
    });
    matchesmin.forEach((match) {
    if(str.substring(match.start, match.end)!=''){
        min=min+1; 
      }    
    });
    matchesnum.forEach((match) {
  if(str.substring(match.start, match.end)!=''){
        //print(str.substring(match.start, match.end));
        nume=nume+1; 
      }    
    });
   
    if(may>2&&min>1&&nume>5){
      return true;
    }
    else{
      return false;
    }
  }
}
  
void main() {
  Password contrasena = Password.longitud(28);
  String contra = contrasena.generaContrasena(true, true, true, false, contrasena._longitud);//llama a la función generaContraseña: usa letras?, usa mayus?, usa números?, usa caract especiales?, longitud de cadena de contraseña
  print(contra);
  if(contrasena.esFuerte(contra)){
    print("La contraseña es fuerte");
  }
  else{
    print("La contraseña no tiene suficientes mayúsculas, minúsculas o números");
  }
}