import 'package:test/test.dart';
import '../lib/string_calculator.dart'; // This file doesn't exist yet, but we'll create it later

void main() {
  test('Empty string should return 0', () {
    final calculator = StringCalculator();
    expect(calculator.add(""), equals(0));
  });
}
