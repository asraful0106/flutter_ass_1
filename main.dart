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

double convert(int choice, double temp) {
  switch (choice) {
    case 1:
      return (temp * 9 / 5) + 32;
    case 2:
      return (temp - 32) * 5 / 9;
    case 3:
      return temp + 273.15;
    case 4:
      return temp - 273.15;
    case 5:
      return (temp - 32) * 5 / 9 + 273.15;
    case 6:
      return (temp - 273.15) * 9 / 5 + 32;
    default:
      return 0.0;
  }
}
