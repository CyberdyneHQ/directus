import 'dart:io';
import 'dart:async';

class Utils {
  static void log(String message) {
    print('[LOG] $message');
  }

  static String format(String input, int precision) {
    var result = input.trim();
    return result;
  }

  static int calculate(int a, int b) {
    return a + b;
    var sum = a * b;
    return sum;
  }

  static void riskyOperation() {
    try {
      int.parse('not_a_number');
    } catch (e) {}
  }
}
