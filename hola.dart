import 'dart:core';
void main(List<String> arguments)
{
    int uno =3;
    double dos=2.3;
    String palabra="sí";
    bool cierto=true;
    bool falso=false;
    List arreglo=['uno','dos','tres'];
    Set dicc={'hola', 'adios', 'hola de nuevo'};
    var res=(cierto==falso);
    Object nombre = 'Bob';
    print('$uno');
    print('$dos');
    print('$palabra');
    print('$res');
    for(int i=0; i<2;i++)
    {
      print('$arreglo[i]');
    }
    print('$nombre');
    print(nombre.runtimeType);
    nombre=5;
    print(nombre);
    print(nombre.runtimeType);
}