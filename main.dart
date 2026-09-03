import 'dart:io';

void main() {
  bool running = true;

  while (running) {
    print('====================================');
    print('       SMART TEMPERATURE CONVERTER');
    print('====================================');
    print('');
    print('1. Celsius to Fahrenheit');
    print('2. Fahrenheit to Celsius');
    print('3. Celsius to Kelvin');
    print('4. Kelvin to Celsius');
    print('5. Fahrenheit to Kelvin');
    print('6. Kelvin to Fahrenheit');
    print('7. Exit');
    print('');
    stdout.write('Enter your choice: ');
    String? choiceInput = stdin.readLineSync();
    int choice = int.tryParse(choiceInput ?? '') ?? -1;

    if (choice == 7) {
      running = false;
      break;
    }

    if (choice < 1 || choice > 6) {
      print('');
      print('Invalid choice. Please try again.');
      print('');
      continue;
    }

    double temp = readTemperature(choice);
    double result = convert(choice, temp);

    print('');
    print(formatResult(choice, temp, result));
    print('');

    stdout.write('Do you want to perform another conversion? (y/n): ');
    String? again = stdin.readLineSync();
    print('');

    if (again == null || again.trim().toLowerCase() != 'y') {
      running = false;
    }
  }

  print('====================================');
  print('       Thank You!');
  print('       Program Ended');
  print('====================================');
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

String formatResult(int choice, double temp, double result) {
  switch (choice) {
    case 1:
      return '${trim(temp)}°C = ${trim(result)}°F';
    case 2:
      return '${trim(temp)}°F = ${trim(result)}°C';
    case 3:
      return '${trim(temp)}°C = ${trim(result)} K';
    case 4:
      return '${trim(temp)} K = ${trim(result)}°C';
    case 5:
      return '${trim(temp)}°F = ${trim(result)} K';
    case 6:
      return '${trim(temp)} K = ${trim(result)}°F';
    default:
      return '';
  }
}

String trim(double value) {
  if (value == value.roundToDouble()) {
    return value.toStringAsFixed(0);
  }
  return value.toStringAsFixed(2);
}
