import 'dart:io'; // unused import
import 'dart:async'; // unused import

class Utils {
  // avoid_print
  static void log(String message) {
    print('[LOG] $message');
  }

  // unused parameter + prefer_final_locals
  static String format(String input, int precision) {
    var result = input.trim();
    return result;
  }

  // dead code after return
  static int calculate(int a, int b) {
    return a + b;
    var sum = a * b; // dead code
    return sum;
  }

  // empty catch block — bad practice
  static void riskyOperation() {
    try {
      int.parse('not_a_number');
    } catch (e) {}
  }
}
