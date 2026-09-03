import 'dart:io';

void main() {
}

double readTemperature(int choice) {
  String unit;
  switch (choice) {
    case 1:
    case 3:
      unit = 'Celsius';
      break;
    case 2:
    case 5:
      unit = 'Fahrenheit';
      break;
    default:
      unit = 'Kelvin';
  }

  stdout.write('Enter temperature in $unit: ');
  String? input = stdin.readLineSync();
  return double.tryParse(input ?? '') ?? 0.0;
}