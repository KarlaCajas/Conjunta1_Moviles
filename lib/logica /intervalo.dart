import 'dart:io';

void main() {
  int num1, num2;

  // Pedir al usuario que introduzca los números
  stdout.write("Introduzca el primer numero: ");
  num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Introduzca el segundo numero: ");
  num2 = int.parse(stdin.readLineSync()!);

  print("");

  if (num1 > num2) {
    // Mostrar los números entre num2 y num1 en orden ascendente
    for (int i = num2 + 1; i < num1; i++) {
      stdout.write("$i ");
    }
  } else if (num2 > num1) {
    // Mostrar los números entre num1 y num2 en orden ascendente
    for (int i = num1 + 1; i < num2; i++) {
      stdout.write("$i ");
    }
  } else {
    // Caso en que los números son iguales
    print("Ambos numeros son iguales");
  }

  print("");
}
